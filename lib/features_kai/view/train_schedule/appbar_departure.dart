import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_model/station/station_provider.dart';

class BuildAppbar extends StatelessWidget {
  const BuildAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StationProvider>(
      builder: (context, stationProvider, child) {
        return Row(
          children: [
            SizedBox(
              width: 260.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        stationProvider.getNameOrigin!,
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        stationProvider.getInitialOrigin!,
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        stationProvider.getNameDestination!,
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        stationProvider.getInitialDestination!,
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
