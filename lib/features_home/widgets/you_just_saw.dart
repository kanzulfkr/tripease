import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_1/features_home/view_%20model/hotel_seen_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class YouJustSaw extends StatefulWidget {
  const YouJustSaw({
    super.key,
  });

  @override
  State<YouJustSaw> createState() => _YouJustSawState();
}

class _YouJustSawState extends State<YouJustSaw> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<HotelSeenProvider>(context, listen: false).getHotelSeen();
    });
  }

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222.h,
      child: Consumer<HotelSeenProvider>(
        builder: (context, hotelSeenProv, child) {
          return hotelSeenProv.hotelSeen.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelSeenProv.hotelSeen.length,
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
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5.r)),
                              child: hotelSeenProv.hotelSeen.isNotEmpty &&
                                      hotelSeenProv.hotelSeen[index].hotel
                                              ?.hotelImage !=
                                          null &&
                                      hotelSeenProv.hotelSeen[index].hotel!
                                          .hotelImage!.isNotEmpty &&
                                      hotelSeenProv.hotelSeen[index].hotel
                                              ?.hotelImage?[0].imageUrl !=
                                          null &&
                                      hotelSeenProv.hotelSeen[index].hotel
                                              ?.hotelImage?[0].imageUrl !=
                                          "h.png" &&
                                      hotelSeenProv.hotelSeen[index].hotel
                                              ?.hotelImage?[0].imageUrl !=
                                          "string" &&
                                      hotelSeenProv.hotelSeen[index].hotel
                                              ?.hotelImage?[0].imageUrl !=
                                          "c.jpg" &&
                                      hotelSeenProv.hotelSeen[index].hotel
                                              ?.hotelImage?[0].imageUrl !=
                                          "m.jpg"
                                  ? Image.network(
                                      hotelSeenProv.hotelSeen[index].hotel!
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
                            height: 110.h,
                            padding: EdgeInsets.all(8.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotelSeenProv.hotelSeen[index].hotel?.name ??
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
                                      width: 110.w,
                                      child: Text(
                                        hotelSeenProv.hotelSeen[index].hotel
                                                ?.address ??
                                            'No data',
                                        style: GoogleFonts.openSans(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  rating: hotelSeenProv
                                          .hotelSeen[index].hotel?.hotelClass
                                          ?.toDouble() ??
                                      0.0,
                                  itemCount: hotelSeenProv
                                          .hotelSeen[index].hotel?.hotelClass ??
                                      0,
                                  itemSize: 12.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container();
        },
      ),
    );
  }
}
