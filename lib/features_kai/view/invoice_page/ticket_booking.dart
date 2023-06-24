import '/features_kai/view_model/order_ticket/response_order_train_provider.dart';
import '/features_kai/view_model/station/departure_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_model/station/return_provider.dart';
import '../../view_model/station/station_provider.dart';

class TicketBooking extends StatelessWidget {
  const TicketBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);
    final stationProv = Provider.of<StationProvider>(context, listen: false);
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);

    return Consumer<ResponseOrderTrainProvider>(
      builder: (context, responseProv, child) {
        var dateResponse = DateFormat('dd MMMM yyyy', 'id_ID')
            .format(responseProv.dataOrder.date!);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.h,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/kai.png',
                        scale: 0.8,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${responseProv.dataOrder.train!.name}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Rp ${responseProv.dataOrder.train!.trainPrice},-',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Statiun ${responseProv.dataOrder.stationOrigin!.origin}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Statiun ${responseProv.dataOrder.stationDestination!.origin}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${responseProv.dataOrder.train!.trainClass}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(113, 114, 117, 1),
                        ),
                      ),
                      const Text(
                        'Tersedia',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(61, 175, 29, 1),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${responseProv.dataOrder.stationOrigin!.arriveTime}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                      Text(
                        '${responseProv.dataOrder.stationDestination!.arriveTime}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateResponse,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(113, 114, 117, 1),
                        ),
                      ),
                      Text(
                        departureProv.getDurationKA(
                            responseProv.dataOrder.stationOrigin!.arriveTime!,
                            responseProv
                                .dataOrder.stationDestination!.arriveTime!),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(113, 114, 117, 1),
                        ),
                      ),
                      Text(
                        dateResponse,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(113, 114, 117, 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
