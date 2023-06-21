import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/station/station_provider.dart';

class BuildAppbar extends StatelessWidget {
  const BuildAppbar({super.key, required this.isPulangPergi});
  final bool isPulangPergi;

  @override
  Widget build(BuildContext context) {
    return Consumer<StationProvider>(
      builder: (context, stationProvider, child) {
        return SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      isPulangPergi
                          ? stationProvider.getNameDestination!
                          : stationProvider.getNameOrigin!,
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      isPulangPergi
                          ? stationProvider.getInitialDestination!
                          : stationProvider.getInitialOrigin!,
                      style: GoogleFonts.openSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 100.w,
                child: Column(
                  children: [
                    Text(
                      isPulangPergi
                          ? stationProvider.getNameOrigin!
                          : stationProvider.getNameDestination!,
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      isPulangPergi
                          ? stationProvider.getInitialOrigin!
                          : stationProvider.getInitialDestination!,
                      style: GoogleFonts.openSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30.w)
            ],
          ),
        );
      },
    );
  }
}
