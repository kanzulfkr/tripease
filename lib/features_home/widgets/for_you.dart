import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_1/features_home/view_%20model/hotel_recommendation_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ForYou extends StatefulWidget {
  const ForYou({
    super.key,
  });

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>
        Provider.of<HotelRecommendProvider>(context, listen: false)
            .getHotelRecommend(true));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 223.h,
      child: Consumer<HotelRecommendProvider>(
        builder: (context, hotelRecommendProv, child) {
          return ListView.builder(
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
                    SizedBox(
                      width: 150.w,
                      height: 110.h,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(5.r)),
                        child: hotelRecommendProv.hotelRecommend.isNotEmpty &&
                                hotelRecommendProv
                                        .hotelRecommend[index].hotelImage !=
                                    null &&
                                hotelRecommendProv.hotelRecommend[index]
                                    .hotelImage!.isNotEmpty &&
                                hotelRecommendProv.hotelRecommend[index]
                                        .hotelImage?[0].imageUrl !=
                                    null &&
                                hotelRecommendProv.hotelRecommend[index]
                                        .hotelImage?[0].imageUrl !=
                                    "h.png" &&
                                hotelRecommendProv.hotelRecommend[index]
                                        .hotelImage?[0].imageUrl !=
                                    "string" &&
                                hotelRecommendProv.hotelRecommend[index]
                                        .hotelImage?[0].imageUrl !=
                                    "c.jpg" &&
                                hotelRecommendProv.hotelRecommend[index]
                                        .hotelImage?[0].imageUrl !=
                                    "m.jpg"
                            ? Image.network(
                                hotelRecommendProv.hotelRecommend[index]
                                    .hotelImage![0].imageUrl!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/hotel.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Container(
                      height: 112.h,
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hotelRecommendProv.hotelRecommend.isNotEmpty
                              ? Text(
                                  hotelRecommendProv.hotelRecommend[index].name
                                      .toString(),
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,
                                )
                              : Text(
                                  'No data',
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
                                child:
                                    hotelRecommendProv.hotelRecommend.isNotEmpty
                                        ? Text(
                                            hotelRecommendProv
                                                    .hotelRecommend[index]
                                                    .address ??
                                                'No data',
                                            style: GoogleFonts.openSans(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(
                                            'No data',
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
                          hotelRecommendProv.hotelRecommend.isNotEmpty
                              ? RatingBarIndicator(
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  rating: hotelRecommendProv
                                          .hotelRecommend[index].datumClass
                                          ?.toDouble() ??
                                      0.0,
                                  itemCount: hotelRecommendProv
                                          .hotelRecommend[index].datumClass ??
                                      0,
                                  itemSize: 12.0,
                                  direction: Axis.horizontal,
                                )
                              : RatingBarIndicator(
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  rating: 0.0,
                                  itemCount: 0,
                                  itemSize: 12.0,
                                  direction: Axis.horizontal,
                                ),

                          hotelRecommendProv.hotelRecommend.isNotEmpty
                              ? Text(
                                  formatter.format(hotelRecommendProv
                                          .hotelRecommend[index]
                                          .hotelRoomStart ??
                                      0),
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : Text(
                                  formatter.format(0),
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                          // Text(
                          //   'Rp 1.960.000',
                          //   style: GoogleFonts.openSans(
                          //     fontSize: 12.sp,
                          //     fontWeight: FontWeight.w400,
                          //     color: const Color.fromRGBO(255, 115, 0, 1),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
