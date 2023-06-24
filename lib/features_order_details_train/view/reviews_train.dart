import 'package:hotel_1/main_page.dart';

import '/features_order/utils/images.dart';
import '/features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../features_order/view/screens/features_order_details_hotel/features_checkin_checkout/component/button_active.dart';
import '../../features_order/view/screens/features_order_details_hotel/features_checkin_checkout/component/button_inactive.dart';
import '../../features_order/view_model/provider/train/train_order_detail_provider.dart';

class ReviewsTrain extends StatefulWidget {
  const ReviewsTrain({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<ReviewsTrain> createState() => _ReviewsTrainState();
}

class _ReviewsTrainState extends State<ReviewsTrain> {
  bool isOne = false;
  bool isTwo = false;
  bool isThree = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<TrainOrderDetailProvider>(
        builder: (context, orderDetail, _) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                    width: 328.w,
                    child: Card(
                        shadowColor: Colors.black.withOpacity(1),
                        elevation: 4.sp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Detail Pesanan',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF0080FF))),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 8.sp),
                                    height: 79.h,
                                    width: 79.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: train2,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              orderDetail.getStationOrigin ??
                                                  '',
                                              style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Icon(Icons.arrow_forward,
                                              size: 14.sp),
                                          Text(
                                              orderDetail
                                                      .getStationDestination ??
                                                  '',
                                              style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.train_outlined,
                                            size: 12.sp,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(orderDetail.getNameTrain ?? '',
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.event_seat_outlined,
                                              size: 12.sp),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(orderDetail.getClassTrain ?? '',
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_month_outlined,
                                              size: 12.sp),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(orderDetail.getDateTime ?? '',
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1.sp,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nomor Pesanan: ',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Expanded(
                                    child: Text(
                                      orderDetail.getTicketOrderCode ?? '',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            glow: false,
                            itemSize: 24,
                            allowHalfRating: false,
                            minRating: 1,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_outline_rounded,
                              color: Color.fromRGBO(255, 195, 0, 1),
                            ),
                            onRatingUpdate: (value) {
                              setState(() {
                                isOne = true;
                                if ((isOne && isTwo && isThree) == true) {
                                  isActive = true;
                                }
                              });
                            },
                          ),
                          const Text(
                            'Kualitas Produk',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            glow: false,
                            itemSize: 24,
                            allowHalfRating: false,
                            minRating: 1,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_outline_rounded,
                              color: Color.fromRGBO(255, 195, 0, 1),
                            ),
                            onRatingUpdate: (value) {
                              setState(() {
                                isTwo = true;
                                if ((isOne && isTwo && isThree) == true) {
                                  isActive = true;
                                }
                              });
                            },
                          ),
                          const Text(
                            'Pelayanan Reservasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            glow: false,
                            itemSize: 24,
                            allowHalfRating: false,
                            minRating: 1,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_outline_rounded,
                              color: Color.fromRGBO(255, 195, 0, 1),
                            ),
                            onRatingUpdate: (value) {
                              setState(() {
                                isThree = true;
                                if ((isOne && isTwo && isThree) == true) {
                                  isActive = true;
                                }
                              });
                            },
                          ),
                          const Text(
                            'Kemudahan Aplikasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.5,
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Tempatnya bagus, fasilitasnya lengkap, makanannya enak-enak, sangat ramah untuk difabel',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                isActive
                    ? ButtonActive(
                        text: 'Beri Nilai',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                      )
                    : ButtonInactive(
                        text: 'Beri Nilai',
                        onTap: () {},
                      ),
                const SizedBox(height: 12),
                ButtonInactive(
                  text: 'Kembali ke Halaman Pesanan',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
