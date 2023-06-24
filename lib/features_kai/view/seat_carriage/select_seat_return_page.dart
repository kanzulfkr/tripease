import 'dart:async';

import 'package:capstone_project_tripease/features_kai/view_model/carriage/carriage_return_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/departure_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/return_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/order_train_model.dart';
import '../../view_model/carriage/select_seat_return_provider.dart';
import '../../view_model/order_ticket/order_train_provider.dart';
import '../../view_model/timer/timer_seat_provider.dart';
import 'widgets/return_carriage.dart';

class SelectSeatReturnCarriage extends StatefulWidget {
  const SelectSeatReturnCarriage({super.key});

  @override
  State<SelectSeatReturnCarriage> createState() =>
      _SelectSeatReturnCarriageState();
}

class _SelectSeatReturnCarriageState extends State<SelectSeatReturnCarriage>
    with TickerProviderStateMixin {
  Timer? countdownTimer;
  final List<int> selectedIndexes = [];
  List<Map<String, dynamic>> items = [];
  late SelectedSeatsReturnProvider selectedIndexProvider;

  @override
  void initState() {
    super.initState();
    final carriageProv =
        Provider.of<CarriageReturnProvider>(context, listen: false);
    final timerProv = Provider.of<TimerSeatProvider>(context, listen: false);
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);
    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);
    Future.microtask(() async {
      await carriageProv.fetchCarriageReturn(
          trainId: returnProv
              .returns[returnProv.selectedDepartIndex as int].trainId as int,
          trainClass: returnProv
              .returns[returnProv.selectedDepartIndex as int].datumClass,
          date: departureProv.returnDateParams);
      debugPrint('prov: ${carriageProv.carriage.length}');
    });

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF), // Ukuran tombol

        title: Text(
          'Pilih Kursi Pulang',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<CarriageReturnProvider>(
        builder: (context, carriageReturnProv, child) {
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
                            // 'Penumpang ${widget.passengerNumber}',
                            'Penumpang 1',
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
                  length: carriageReturnProv.carriage.length,
                  child: SizedBox(
                    height: 500.h,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          tabs: List.generate(
                            carriageReturnProv.carriage.length,
                            (index) => Tab(
                                text: carriageReturnProv.carriage[index].name),
                          ),
                          onTap: (value) async {
                            carriageReturnProv.setSelectedTabIndex(value);
                          },
                        ),
                        Expanded(
                          child: TabBarView(
                            children: List.generate(
                              carriageReturnProv.carriage.length,
                              (index) => const ReturnCarriagePage(),
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
                    final selectedSeatsReturnProv =
                        Provider.of<SelectedSeatsReturnProvider>(context,
                            listen: false);
                    final selectedSeatsReturn =
                        selectedSeatsReturnProv.selectedSeats;

                    DateTime now = DateTime.now();
                    DateTime formattedDate =
                        DateTime(now.year, now.month, now.day);

                    var stationOriginId = carriageReturnProv
                        .carriage[carriageReturnProv.selectedTabIndex as int]
                        .train!
                        .route![0]
                        .stationId;
                    var stationDestinationId = carriageReturnProv
                        .carriage[carriageReturnProv.selectedTabIndex as int]
                        .train
                        ?.route?[1]
                        .stationId;
                    var trainCarriageId = carriageReturnProv
                        .carriage[carriageReturnProv.selectedTabIndex as int]
                        .trainCarriageId;
                    var trainSeatId = carriageReturnProv.trainSeatId;

                    if (selectedSeatsReturn.isNotEmpty) {
                      print('Kursi return yg dipilih: $selectedSeatsReturn');
                      final orderTrain = Provider.of<PostOrderTrainProvider>(
                          context,
                          listen: false);

                      orderTrain
                          .addTicketTravelDetailReturn(TicketTravelerDetail(
                        date: formattedDate,
                        stationDestinationId: stationDestinationId,
                        stationOriginId: stationOriginId,
                        trainCarriageId: trainCarriageId,
                        trainSeatId: trainSeatId,
                      ));
                    } else {
                      print('Belum ada kursi return yg dipilih');
                    }
                    selectedSeatsReturnProv.confirmSelectedSeats();

                    Navigator.pop(context);
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
