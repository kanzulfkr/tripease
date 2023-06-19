import 'dart:async';
import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../model/order_train_model.dart';
import '../../view_model/carriage/carriage_provider.dart';
import '../../view_model/order_ticket/order_train_provider.dart';
import '../../view_model/carriage/select_seat_kai_provider.dart';
import '../../view_model/timer/timer_seat_provider.dart';
import 'widgets/ekonomi_carriage.dart';

class SelectSeatKai extends StatefulWidget {
  final int passengerNumber;

  const SelectSeatKai({super.key, required this.passengerNumber});

  @override
  State<SelectSeatKai> createState() => _SelectSeatKaiState();
}

class _SelectSeatKaiState extends State<SelectSeatKai>
    with TickerProviderStateMixin {
  Timer? countdownTimer;
  final List<int> selectedIndexes = [];
  List<Map<String, dynamic>> items = [];
  late SelectedSeatsProvider selectedIndexProvider;

  @override
  void initState() {
    super.initState();
    final carriageProv = Provider.of<CarriageProvider>(context, listen: false);
    final trainProv = Provider.of<TrainProvider>(context, listen: false);
    final timerProv = Provider.of<TimerSeatProvider>(context, listen: false);

    // debugPrint('zzzzzz : ${carriageProv.carriage[2].name}');
    debugPrint('zzzzzz : ${trainProv.getClassTrain}');

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

    Future.microtask(() async {
      await carriageProv.fetchCarriageEko(
        trainId: trainProv.getTrainId!,
        trainClass: trainProv.getClassTrain,
      );
    });
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
    final carriageProvider =
        Provider.of<CarriageProvider>(context, listen: false);
    var tabIndex = carriageProvider.selectedTabIndex;
    selectedIndexProvider = Provider.of<SelectedSeatsProvider>(context);

    TabController tabController =
        TabController(length: carriageProvider.carriage.length, vsync: this);

    selectedIndexProvider = Provider.of<SelectedSeatsProvider>(context);

    return Consumer<SelectedSeatsProvider>(
      builder: (context, selecyedIndexProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color(0XFF0080FF), // Ukuran tombol

            title: Text(
              'Kursi',
              style: GoogleFonts.openSans(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: Consumer<CarriageProvider>(
            builder: (context, carriageProvider, child) {
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
                      length: carriageProvider.carriage.length,
                      child: TabBar(
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: Text(
                              carriageProvider.carriage[0].name!,
                              style: GoogleFonts.openSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              carriageProvider.carriage[1].name!,
                              style: GoogleFonts.openSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              carriageProvider.carriage[2].name!,
                              style: GoogleFonts.openSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                        onTap: (index) {
                          carriageProvider.setSelectedTabIndex(index);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 490,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        Tab(child: EkonomiCarriagePage()),
                        Tab(child: EkonomiCarriagePage()),
                        Tab(child: EkonomiCarriagePage()),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ElevatedButton(
                      onPressed: () {
                        final selectedSeatsProvider =
                            Provider.of<SelectedSeatsProvider>(context,
                                listen: false);
                        final selectedSeats =
                            selectedSeatsProvider.selectedSeats;

                        DateTime now = DateTime.now();

                        DateTime formattedDate =
                            DateTime(now.year, now.month, now.day);

                        var stationDestinationId = carriageProvider
                            .carriage[carriageProvider.selectedTabIndex]
                            .train!
                            .route![1]
                            .stationId;
                        var stationOriginId = carriageProvider
                            .carriage[carriageProvider.selectedTabIndex]
                            .train!
                            .route![0]
                            .stationId;
                        var trainCarriageId = carriageProvider
                            .carriage[carriageProvider.selectedTabIndex]
                            .trainCarriageId;
                        var trainSeatId = carriageProvider.trainSeatId;

                        if (selectedSeats.isNotEmpty) {
                          // Lakukan sesuatu dengan kursi yang dipilih, misalnya, kirim ke penyedia
                          print('Kursi yang dipilih: $selectedSeats');

                          final orderTrain =
                              Provider.of<PostOrderTrainProvider>(context,
                                  listen: false);

                          orderTrain.addTicketTravelDetail(TicketTravelerDetail(
                            date: formattedDate,
                            stationDestinationId: stationDestinationId,
                            stationOriginId: stationOriginId,
                            trainCarriageId: trainCarriageId,
                            trainSeatId: trainSeatId,
                          ));
                        } else {
                          print('Belum ada kursi yang dipilih');
                        }

                        selectedSeatsProvider.confirmSelectedSeats();

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
      },
    );
  }
}
