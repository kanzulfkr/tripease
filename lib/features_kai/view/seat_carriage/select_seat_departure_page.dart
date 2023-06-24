// ignore_for_file: avoid_print

import 'dart:async';
import 'package:capstone_project_tripease/features_kai/view/seat_carriage/select_seat_return_page.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/station_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../model/order_train_model.dart';
import '../../view_model/carriage/carriage_departure_provider.dart';
import '../../view_model/order_ticket/order_train_provider.dart';
import '../../view_model/carriage/select_seat_departure_provider.dart';
import '../../view_model/station/departure_provider.dart';
import '../../view_model/timer/timer_seat_provider.dart';
import 'widgets/departure_carriage.dart';

class SelectSeatDepartureCarriage extends StatefulWidget {
  final int passengerNumber;

  const SelectSeatDepartureCarriage({super.key, required this.passengerNumber});

  @override
  State<SelectSeatDepartureCarriage> createState() =>
      _SelectSeatDepartureCarriageState();
}

class _SelectSeatDepartureCarriageState
    extends State<SelectSeatDepartureCarriage> with TickerProviderStateMixin {
  Timer? countdownTimer;
  final List<int> selectedIndexes = [];
  List<Map<String, dynamic>> items = [];
  late SelectedSeatsDepartureProvider selectedIndexProvider;

  @override
  void initState() {
    super.initState();
    // final carriageProv =
    // Provider.of<CarriageDepartureProvider>(context, listen: false);
    final timerProv = Provider.of<TimerSeatProvider>(context, listen: false);
    // final departureProv =
    //     Provider.of<DepartureProvider>(context, listen: false);
    // Future.microtask(() async {
    //   await carriageProv.fetchCarriageDeparture(
    //     trainId: departureProv
    //         .departure[departureProv.selectedDepartIndex as int].trainId as int,
    //     trainClass: departureProv
    //         .departure[departureProv.selectedDepartIndex as int].datumClass,
    //   );
    //   debugPrint('prov: ${carriageProv.carriage.length}');
    // });

    timerProv.stopCountDown();
    timerProv.startCountDown(context);
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (timerProv.isTimeUp()) {
          countdownTimer?.cancel();

          Navigator.of(context).pop();
          showDialogWithContext(context);
        }
      },
    );
  }

  Future<dynamic> showDialogWithContext(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          title: Text('Time Up'),
          content: Text('The time has run out.'),
        );
      },
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndexProvider =
        Provider.of<SelectedSeatsDepartureProvider>(context);
    final stationProv = Provider.of<StationProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF), // Ukuran tombol

        title: Text(
          stationProv.pulangPergi == false
              ? 'Pilih Kursi'
              : 'Pilih Kursi Keberangkatan',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<CarriageDepartureProvider>(
        builder: (context, carriageDepartureProv, child) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Container(
                        height: 45.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            'Penumpang ${widget.passengerNumber}',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Consumer<TimerSeatProvider>(
                      builder: (context, timerSeat, child) {
                        return Text(
                          timerSeat.timer,
                          style: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: DefaultTabController(
                  length: carriageDepartureProv.carriage.length,
                  child: SizedBox(
                    height: 500.h,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          tabs: List.generate(
                            carriageDepartureProv.carriage.length,
                            (index) => Tab(
                                text:
                                    carriageDepartureProv.carriage[index].name),
                          ),
                          onTap: (value) async {
                            carriageDepartureProv.setSelectedTabIndex(value);
                          },
                        ),
                        Expanded(
                          child: TabBarView(
                            children: List.generate(
                              carriageDepartureProv.carriage.length,
                              (index) => const DepartureCarriagePage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButton(
                  onPressed: () {
                    final selectedSeatsDepartureProv =
                        Provider.of<SelectedSeatsDepartureProvider>(context,
                            listen: false);

                    final selectedSeats =
                        selectedSeatsDepartureProv.selectedSeats;

                    DateTime now = DateTime.now();
                    DateTime formattedDate =
                        DateTime(now.year, now.month, now.day);

                    var stationDestinationId = carriageDepartureProv
                        .carriage[carriageDepartureProv.selectedTabIndex as int]
                        .train
                        ?.route?[1]
                        .stationId;
                    var stationOriginId = carriageDepartureProv
                        .carriage[carriageDepartureProv.selectedTabIndex as int]
                        .train!
                        .route![0]
                        .stationId;
                    var trainCarriageId = carriageDepartureProv
                        .carriage[carriageDepartureProv.selectedTabIndex as int]
                        .trainCarriageId;
                    var trainSeatId = carriageDepartureProv.trainSeatId;

                    if (selectedSeats.isNotEmpty) {
                      print('Kursi departure yg dipilih: $selectedSeats');
                      final orderTrain = Provider.of<PostOrderTrainProvider>(
                          context,
                          listen: false);

                      orderTrain.addTicketTravelDetail(TicketTravelerDetail(
                        date: formattedDate,
                        stationDestinationId: stationDestinationId,
                        stationOriginId: stationOriginId,
                        trainCarriageId: trainCarriageId,
                        trainSeatId: trainSeatId,
                      ));
                    } else {
                      print('Belum ada kursi departure yg dipilih');
                    }
                    selectedSeatsDepartureProv.confirmSelectedSeats();

                    if (!stationProv.pulangPergi) {
                      Navigator.pop(context);
                    } else if (stationProv.pulangPergi) {
                      print('pulangpergiiiiii');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SelectSeatReturnCarriage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 50.h),
                    backgroundColor: const Color(0XFF0080FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Konfirmasi',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
