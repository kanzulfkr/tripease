import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/station/history_station_provider.dart';
import '../../../view_model/station/station_provider.dart';

class HistorySearch extends StatefulWidget {
  const HistorySearch({super.key, required this.isOrigin});
  final bool isOrigin;

  @override
  State<HistorySearch> createState() => _HistorySearchState();
}

class _HistorySearchState extends State<HistorySearch> {
  @override
  Widget build(BuildContext context) {
    final historyStationProv =
        Provider.of<HistoryStationProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'History Pencarian',
          style: GoogleFonts.openSans(
              fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        Container(
          height: 230.h,
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(8),
              right: Radius.circular(8),
            ),
            color: const Color(0xF9FAFBFB),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  final stationProv =
                      Provider.of<StationProvider>(context, listen: false);
                  if (widget.isOrigin) {
                    print('Origin');
                    stationProv.setIdOrigin(historyStationProv
                        .histories[index].stationOrigin!.stationId);
                    stationProv.setNameOrigin(historyStationProv
                        .histories[index].stationOrigin!.name);
                    stationProv.setInitialOrigin(historyStationProv
                        .histories[index].stationOrigin!.initial);
                    print('id : ${stationProv.getIdOrigin}');
                    print('Name :${stationProv.getNameOrigin}');
                    print('init : ${stationProv.getInitialOrigin}');

                    stationProv.setAsalController(
                        '${stationProv.getNameOrigin!} (${stationProv.getInitialOrigin!})');
                    Navigator.pop(context);
                  } else {
                    print('Destination');
                    stationProv.setIdDestination(historyStationProv
                        .histories[index].stationOrigin!.stationId);
                    stationProv.setNameDestination(historyStationProv
                        .histories[index].stationOrigin!.name);
                    stationProv.setInitialDestination(historyStationProv
                        .histories[index].stationOrigin!.initial);
                    print('id : ${stationProv.getIdDestination}');
                    print('Name :${stationProv.getNameDestination}');
                    print('init : ${stationProv.getInitialDestination}');
                    stationProv.setTujuanController(
                        '${stationProv.getNameDestination!} (${stationProv.getInitialDestination!})');
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              historyStationProv.histories.isNotEmpty
                                  ? Text(
                                      historyStationProv.histories[index]
                                          .stationOrigin!.name!,
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      'No Data',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              SizedBox(width: 8.h),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 8.h),
                              historyStationProv.histories.isNotEmpty
                                  ? Text(
                                      historyStationProv.histories[index]
                                          .stationOrigin!.initial!,
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      'No Data',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          historyStationProv.histories.isNotEmpty
                              ? Text(
                                  historyStationProv
                                      .histories[index].stationOrigin!.origin!,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Text(
                                  'No Data',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 4.h,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
