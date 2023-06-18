import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/carriage/carriage_provider.dart';
import '../../../view_model/carriage/select_seat_kai_provider.dart';
import '../../../view_model/train/train_provider.dart';

class EkonomiCarriagePage extends StatefulWidget {
  const EkonomiCarriagePage({super.key});

  @override
  State<EkonomiCarriagePage> createState() => _EkonomiCarriagePageState();
}

class _EkonomiCarriagePageState extends State<EkonomiCarriagePage> {
  @override
  void initState() {
    super.initState();
    // final carriageProv = Provider.of<CarriageProvider>(context, listen: false);
    final trainProv = Provider.of<TrainProvider>(context, listen: false);

    Future.microtask(() =>
        Provider.of<CarriageProvider>(context, listen: false).fetchCarriageEko(
          trainId: trainProv.getTrainId!,
          trainClass: trainProv.getClassTrain,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedSeatsProvider>(
        builder: (context, selectedSeatProvider, _) {
      return SizedBox(
        height: 550,
        width: double.maxFinite,
        child: Row(
          children: [
            SingleChildScrollView(
              child: Consumer<CarriageProvider>(
                builder: (context, carriageProvider, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    // color: Colors.amber,
                    // height: 830.h,
                    width: 360,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // list nomorrr
                        Column(
                          children: [
                            const Text('', style: TextStyle(fontSize: 14)),
                            Container(
                              height: 800,
                              width: 25,
                              margin: EdgeInsets.only(top: 10),
                              child: ListView.builder(
                                itemCount: 24,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 25,
                                    width: 25,
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Center(
                                        child: Text(
                                      '${index + 1}',
                                      style: GoogleFonts.openSans(fontSize: 14),
                                    )),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // AAAAAAAAAAA
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              const Text('A', style: TextStyle(fontSize: 14)),
                              Container(
                                  height: 800,
                                  width: 25,
                                  margin: EdgeInsets.only(top: 10),
                                  child: ListView.builder(
                                    itemCount: carriageProvider.seatA.length,
                                    itemBuilder: (context, index) {
                                      final selectedSeatsProvider =
                                          Provider.of<SelectedSeatsProvider>(
                                              context);
                                      final selectedSeats =
                                          selectedSeatsProvider.selectedSeats;
                                      final item =
                                          carriageProvider.seatA[index];
                                      final isSeatSelected =
                                          selectedSeats.contains(item.id);

                                      final color = isSeatSelected
                                          ? Colors.blue
                                          : Colors.white;

                                      return InkWell(
                                        onTap: () {
                                          selectedSeatsProvider.selectedSeats;
                                          if (isSeatSelected) {
                                            selectedSeatsProvider
                                                .deselectSeat(item.id);
                                          } else {
                                            selectedSeatsProvider
                                                .selectSeat(item.id);
                                          }

                                          carriageProvider
                                              .setTrainSeatId(item.id);

                                          print('Kursi ${item.id}');
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 4,
                                                spreadRadius: 0,
                                                offset: Offset.zero,
                                              ),
                                            ],
                                            border: Border.all(
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: isSeatSelected
                                                ? Colors.blue
                                                : color,
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ),

                        // BBBBBBBBBBBB
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              const Text('B', style: TextStyle(fontSize: 14)),
                              Container(
                                height: 800,
                                width: 25,
                                margin: EdgeInsets.only(top: 10),
                                child: ListView.builder(
                                  itemCount: carriageProvider.seatB.length,
                                  itemBuilder: (context, index) {
                                    final selectedSeatsProvider =
                                        Provider.of<SelectedSeatsProvider>(
                                            context);
                                    final selectedSeats =
                                        selectedSeatsProvider.selectedSeats;
                                    final item = carriageProvider.seatB[index];
                                    final isSeatSelected =
                                        selectedSeats.contains(item.id);

                                    final color = isSeatSelected
                                        ? Colors.blue
                                        : Colors.white;

                                    return InkWell(
                                      onTap: () {
                                        selectedSeatsProvider.selectedSeats;
                                        if (isSeatSelected) {
                                          selectedSeatsProvider
                                              .deselectSeat(item.id);
                                        } else {
                                          selectedSeatsProvider
                                              .selectSeat(item.id);
                                        }

                                        carriageProvider
                                            .setTrainSeatId(item.id);
                                        print('Kursi ${item.id}');
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: color,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        //  CCCCCCCCCCCCCCCCCC
                        Column(
                          children: [
                            const Text('C', style: TextStyle(fontSize: 14)),
                            Container(
                              height: 701,
                              width: 25,
                              margin: EdgeInsets.only(top: 109),
                              child: ListView.builder(
                                itemCount: carriageProvider.seatC.length,
                                itemBuilder: (context, index) {
                                  final selectedSeatsProvider =
                                      Provider.of<SelectedSeatsProvider>(
                                          context);
                                  final selectedSeats =
                                      selectedSeatsProvider.selectedSeats;
                                  final item = carriageProvider.seatC[index];
                                  final isSeatSelected =
                                      selectedSeats.contains(item.id);

                                  final color = isSeatSelected
                                      ? Colors.blue
                                      : Colors.white;

                                  return InkWell(
                                    onTap: () {
                                      selectedSeatsProvider.selectedSeats;
                                      if (isSeatSelected) {
                                        selectedSeatsProvider
                                            .deselectSeat(item.id);
                                      } else {
                                        selectedSeatsProvider
                                            .selectSeat(item.id);
                                      }

                                      carriageProvider.setTrainSeatId(item.id);
                                      print('Kursi ${item.id}');
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      margin: EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                            offset: Offset.zero,
                                          ),
                                        ],
                                        border:
                                            Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(8),
                                        color: color,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // DDDDDDDDDDDDDD
                        Padding(
                          padding: EdgeInsets.only(left: 58, right: 8),
                          child: Column(
                            children: [
                              const Text('D', style: TextStyle(fontSize: 14)),
                              Container(
                                height: 734,
                                width: 25,
                                margin: EdgeInsets.only(top: 76),
                                child: ListView.builder(
                                  itemCount: carriageProvider.seatD.length,
                                  itemBuilder: (context, index) {
                                    final selectedSeatsProvider =
                                        Provider.of<SelectedSeatsProvider>(
                                            context);
                                    final selectedSeats =
                                        selectedSeatsProvider.selectedSeats;
                                    final item = carriageProvider.seatD[index];
                                    final isSeatSelected =
                                        selectedSeats.contains(item.id);

                                    final color = isSeatSelected
                                        ? Colors.blue
                                        : Colors.white;

                                    return InkWell(
                                      onTap: () {
                                        selectedSeatsProvider.selectedSeats;
                                        if (isSeatSelected) {
                                          selectedSeatsProvider
                                              .deselectSeat(item.id);
                                        } else {
                                          selectedSeatsProvider
                                              .selectSeat(item.id);
                                        }

                                        carriageProvider
                                            .setTrainSeatId(item.id);
                                        print('Kursi ${item.id}');
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: color,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // EEEEEEEEE
                        Column(
                          children: [
                            const Text('E', style: TextStyle(fontSize: 14)),
                            Container(
                              height: 734,
                              width: 25,
                              margin: EdgeInsets.only(top: 76),
                              child: ListView.builder(
                                itemCount: carriageProvider.seatE.length,
                                itemBuilder: (context, index) {
                                  final selectedSeatsProvider =
                                      Provider.of<SelectedSeatsProvider>(
                                          context);
                                  final selectedSeats =
                                      selectedSeatsProvider.selectedSeats;
                                  final item = carriageProvider.seatE[index];
                                  final isSeatSelected =
                                      selectedSeats.contains(item.id);

                                  final color = isSeatSelected
                                      ? Colors.blue
                                      : Colors.white;

                                  return InkWell(
                                    onTap: () {
                                      selectedSeatsProvider.selectedSeats;
                                      if (isSeatSelected) {
                                        selectedSeatsProvider
                                            .deselectSeat(item.id);
                                      } else {
                                        selectedSeatsProvider
                                            .selectSeat(item.id);
                                      }

                                      carriageProvider.setTrainSeatId(item.id);
                                      print('Kursi ${item.id}');
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      margin: EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                            offset: Offset.zero,
                                          ),
                                        ],
                                        border:
                                            Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(8),
                                        color: color,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
