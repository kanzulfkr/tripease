import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForYou extends StatelessWidget {
  const ForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 223.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(

            width: 150.w,
            margin: EdgeInsets.fromLTRB(20.w, 0, 0, 1.h),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 250, 251, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 0.1,
                  blurRadius: 0.7,
                  offset: const Offset(0.5, 0.5),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(5.r)),
                  child: Image.asset(
                    'assets/images/hotel.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 112.h,
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'JW Marriot',
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 112.w,
                            child: Text(
                              'Jl. Putri Hijau No. 10 Medan, Indonesia',
                              style: GoogleFonts.openSans(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18.sp,
                            color: const Color.fromRGBO(255, 195, 0, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 18.sp,
                            color: const Color.fromRGBO(255, 195, 0, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 18.sp,
                            color: const Color.fromRGBO(255, 195, 0, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 18.sp,
                            color: const Color.fromRGBO(255, 195, 0, 1),
                          ),
                        ],
                      ),
                      Text(
                        'Rp 2.500.000',
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        'Rp 1.960.000',
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 115, 0, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
