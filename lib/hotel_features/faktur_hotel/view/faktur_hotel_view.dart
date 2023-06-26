import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_1/features_order/view/screens/pesanan_screen.dart';
import 'package:hotel_1/hotel_features/detail_hotel/viewmodel/detail_hotel_provider.dart';
import 'package:hotel_1/main_page.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../features_order/view_model/provider/tab_provider.dart';
import '../../../selected_tab.dart';
import '../../payment_result/viewmodel/patch_order_viewmodel.dart';

class FakturHotel extends StatefulWidget {
  const FakturHotel({Key? key}) : super(key: key);

  @override
  State<FakturHotel> createState() => _FakturHotelState();
}

class _FakturHotelState extends State<FakturHotel> {
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  List<String> roomImages = [
    'assets/images/detail_k1.jpeg',
    'assets/images/detail_k2.jpeg',
    'assets/images/detail_k3.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<PatchOrderProvider>(
      builder: (context, patchOrderProv, child) {
        bool isFacilityAvailable(String facilityName) {
          return patchOrderProv.data.hotel?.hotelRoom?.hotelRoomFacility
                  ?.any((facility) => facility.name == facilityName) ??
              false;
        }

        bool isBreakfastAvailable = isFacilityAvailable('Breakfast');
        bool isWifiAvailable = isFacilityAvailable('Wifi');
        return Scaffold(
          appBar: AppBar(
            title: const Text('Faktur'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      QrImageView(
                        data: patchOrderProv.data.ticketOrderCode.toString(),
                        version: QrVersions.auto,
                        size: 256,
                      ),
                      Text(
                        '${patchOrderProv.data.ticketOrderCode}',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: 0.025,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 195,
                              padding: EdgeInsets.only(
                                  left: 16.sp, top: 16.sp, right: 16.sp),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    patchOrderProv.data.hotel?.name
                                            .toString() ??
                                        '',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      letterSpacing: 0.04,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              patchOrderProv.data.hotel?.address
                                                      .toString() ??
                                                  '',
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
                                                letterSpacing: 0.015,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    rating: patchOrderProv
                                            .data.hotel?.hotelClass
                                            ?.toDouble() ??
                                        0.0,
                                    itemCount:
                                        patchOrderProv.data.hotel?.hotelClass ??
                                            0,
                                    itemSize: 12.0,
                                    direction: Axis.horizontal,
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    formatter.format(patchOrderProv.data.price),
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      letterSpacing: 0.04,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  // Text(
                                  //   'Rp. ${widget.list.discPrice!. toString()}',
                                  //   style: TextStyle(
                                  //     fontFamily: 'Open Sans',
                                  //     fontWeight: FontWeight.w400,
                                  //     fontSize: 12,
                                  //     letterSpacing: 0.04,
                                  //     color: Colors.orange
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150.w,
                                height: 150.h,
                                child: patchOrderProv.data.hotel?.hotelImage?[0]
                                                .imageUrl !=
                                            "string" &&
                                        patchOrderProv.data.hotel
                                                ?.hotelImage?[0].imageUrl !=
                                            null &&
                                        patchOrderProv.data.hotel
                                                ?.hotelImage?[0].imageUrl !=
                                            "h.png" &&
                                        patchOrderProv.data.hotel
                                                ?.hotelImage?[0].imageUrl !=
                                            "c.jpg" &&
                                        patchOrderProv.data.hotel
                                                ?.hotelImage?[0].imageUrl !=
                                            "m.jpg"
                                    ? Image.network(
                                        patchOrderProv.data.hotel
                                                ?.hotelImage?[0].imageUrl
                                                .toString() ??
                                            '',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/hotel1.jpeg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F8),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.1.w,
                          ),
                        ),
                        child: Consumer<DetailHotelProvider>(
                          builder: (context, detailHotelProv, child) {
                            return ExpansionTile(
                              title: Text(
                                'Tentang Hotel',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.04.sp),
                              ),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      16.sp, 8.sp, 16.sp, 8.sp),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Deskripsi Hotel',
                                            style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.04.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            detailHotelProv
                                                    .detailHotel.description ??
                                                '',
                                            style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.04.sp),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Fasilitas Umum',
                                            style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.04.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Column(
                                        children: detailHotelProv
                                                .detailHotel.hotelFacilities
                                                ?.map((amenity) => Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .check_circle_outline,
                                                          color:
                                                              Colors.blueAccent,
                                                        ),
                                                        SizedBox(
                                                          width: 12.w,
                                                        ),
                                                        Text(
                                                          amenity.name
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .openSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing:
                                                                0.04.sp,
                                                          ),
                                                        )
                                                      ],
                                                    ))
                                                .toList() ??
                                            [],
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Komentar',
                                            style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.04.sp),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: detailHotelProv
                                                  .detailHotel.hotelRating
                                                  ?.map((review) => Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10.sp),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.sp),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1.0.w,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.r),
                                                          ),
                                                          width: 200.w,
                                                          height: 180.h,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(review
                                                                      .username
                                                                      .toString()),
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .amber,
                                                                    ),
                                                                    rating: review
                                                                            .rating
                                                                            ?.toDouble() ??
                                                                        0.0,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        12.0,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(DateTime(
                                                                          review.createdAt?.year ??
                                                                              0,
                                                                          review.createdAt?.month ??
                                                                              0,
                                                                          review.createdAt?.day ??
                                                                              0)
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          10)),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              Text(review.review
                                                                  .toString()),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                      // Blank Space
                                                                      ),
                                                                  // Container(
                                                                  //   child: Row(
                                                                  //     children: [
                                                                  //       Row(
                                                                  //         children: [
                                                                  //           IconButton(
                                                                  //             icon: Icon(
                                                                  //               Icons.thumb_up,
                                                                  //               color: viewModel.likeActive ? Colors.blue : null,
                                                                  //             ),
                                                                  //             onPressed: viewModel.handleLikePressed,
                                                                  //           ),
                                                                  //         ],
                                                                  //       ),
                                                                  //       Row(
                                                                  //         children: [
                                                                  //           IconButton(
                                                                  //             icon: Icon(
                                                                  //               Icons.thumb_down,
                                                                  //               color: viewModel.dislikeActive ? Colors.blue : null,
                                                                  //             ),
                                                                  //             onPressed: viewModel.handleDislikePressed,
                                                                  //           ),
                                                                  //         ],
                                                                  //       ),
                                                                  //     ],
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                                  .toList() ??
                                              [],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(
                                  0xFF0080FF), // Use the hex color code #0080FF
                              width: 1.0.w,
                            ),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0.sp),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      patchOrderProv
                                              .data.hotel?.hotelRoom?.name ??
                                          'No data',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        letterSpacing: 0.04,
                                      ),
                                    ),
                                    patchOrderProv.data.hotel?.hotelRoom
                                                ?.discountPrice !=
                                            0
                                        ? Text(
                                            '${formatter.format(patchOrderProv.data.hotel!.hotelRoom!.discountPrice)}/Malam',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              letterSpacing: 0.04,
                                            ),
                                          )
                                        : Text(
                                            '${formatter.format(patchOrderProv.data.hotel!.hotelRoom!.normalPrice)}/Malam',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              letterSpacing: 0.04,
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: patchOrderProv
                                                .data
                                                .hotel!
                                                .hotelRoom!
                                                .hotelRoomImage!
                                                .isNotEmpty &&
                                            patchOrderProv
                                                    .data
                                                    .hotel
                                                    ?.hotelRoom
                                                    ?.hotelRoomImage?[0]
                                                    .imageUrl !=
                                                "string" &&
                                            patchOrderProv
                                                    .data
                                                    .hotel
                                                    ?.hotelRoom
                                                    ?.hotelRoomImage?[0]
                                                    .imageUrl !=
                                                null &&
                                            patchOrderProv
                                                    .data
                                                    .hotel
                                                    ?.hotelRoom
                                                    ?.hotelRoomImage?[0]
                                                    .imageUrl !=
                                                "h.png" &&
                                            patchOrderProv
                                                    .data
                                                    .hotel
                                                    ?.hotelRoom
                                                    ?.hotelRoomImage?[0]
                                                    .imageUrl !=
                                                "c.jpg"
                                        ? patchOrderProv.data.hotel!.hotelRoom!
                                            .hotelRoomImage!
                                            .map(
                                              (image) => Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.sp),
                                                child: Container(
                                                  width: 110,
                                                  height: 59,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      width: 0.1,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: Image.network(image
                                                      .imageUrl
                                                      .toString()),
                                                ),
                                              ),
                                            )
                                            .toList()
                                        : roomImages
                                            .map(
                                              (e) => Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.sp),
                                                child: Container(
                                                  width: 110,
                                                  height: 59,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      width: 0.1,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: Image.asset(e),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.person),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          patchOrderProv.data.hotel?.hotelRoom
                                                  ?.numberOfGuest
                                                  .toString() ??
                                              'No data',
                                          style: const TextStyle(
                                            fontFamily: 'Open Sans',
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.bed),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          '${patchOrderProv.data.hotel?.hotelRoom?.numberOfMattress.toString() ?? 'No data'} ${patchOrderProv.data.hotel?.hotelRoom?.mattressSize ?? ''}',
                                          style: const TextStyle(
                                            fontFamily: 'Open Sans',
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: isBreakfastAvailable == true
                                              ? Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.restaurant),
                                                    SizedBox(
                                                      width: 14.w,
                                                    ),
                                                    Text(
                                                      "Breakfast",
                                                      style: TextStyle(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        letterSpacing: 0.04,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    const Stack(
                                                      children: [
                                                        Icon(Icons.restaurant),
                                                        Icon(Icons.close)
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 14.w,
                                                    ),
                                                    Text(
                                                      'No Breakfast',
                                                      style: TextStyle(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        letterSpacing: 0.04,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.credit_card),
                                            SizedBox(
                                              width: 14.w,
                                            ),
                                            Text(
                                              patchOrderProv
                                                          .data
                                                          .hotel
                                                          ?.hotelPolicy
                                                          ?.isPolicyCanceled ==
                                                      true
                                                  ? 'Refundable'
                                                  : 'No Refundable',
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                                letterSpacing: 0.04,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: isWifiAvailable == true
                                              ? Row(
                                                  children: [
                                                    const Icon(Icons.wifi),
                                                    SizedBox(
                                                      width: 14.w,
                                                    ),
                                                    Text(
                                                      "Wifi",
                                                      style: TextStyle(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        letterSpacing: 0.04,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    const Stack(
                                                      children: [
                                                        Icon(Icons.wifi),
                                                        Icon(Icons.close)
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 14.w,
                                                    ),
                                                    Text(
                                                      "No Wifi",
                                                      style: TextStyle(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        letterSpacing: 0.04,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        // Container(
                                        //   child: Row(
                                        //     children: [
                                        //       Icon(Icons.event_available),
                                        //       SizedBox(width: 14,),
                                        //       Text(widget.room.reSchedule,
                                        //         style: TextStyle(
                                        //           fontFamily: 'Open Sans',
                                        //           fontWeight: FontWeight.w600,
                                        //           fontSize: 12,
                                        //           letterSpacing: 0.04,
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    patchOrderProv.data.hotel?.hotelPolicy
                                                ?.isSmoking ==
                                            false
                                        ? Row(
                                            children: [
                                              const Icon(Icons.smoke_free),
                                              SizedBox(
                                                width: 14.w,
                                              ),
                                              Text(
                                                'Dilarang Merokok',
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.04,
                                                ),
                                              )
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              const Icon(Icons.smoking_rooms),
                                              SizedBox(
                                                width: 14.w,
                                              ),
                                              Text(
                                                'Diperbolehkan Merokok',
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.04,
                                                ),
                                              )
                                            ],
                                          )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hotel',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                formatter.format(patchOrderProv
                                        .data.hotel?.hotelRoom?.normalPrice ??
                                    0),
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'Asuransi',
                          //       style: TextStyle(
                          //         fontFamily: 'Open Sans',
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: 14.sp,
                          //         letterSpacing: 0.025,
                          //       ),
                          //     ),
                          //     // Text(
                          //     //   widget.room.asuransi,
                          //     //   style: TextStyle(
                          //     //     fontFamily: 'Open Sans',
                          //     //     fontWeight: FontWeight.w600,
                          //     //     fontSize: 14,
                          //     //     letterSpacing: 0.025,
                          //     //   ),
                          //     // )
                          //   ],
                          // ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kupon',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                '- Rp 50.000',
                                style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    letterSpacing: 0.025,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          DividerTheme(
                            data: DividerThemeData(
                              color: Colors.black, // Set the color to black
                              thickness: 1.0
                                  .sp, // Increase or decrease the thickness as desired
                            ),
                            child: const Divider(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                formatter
                                    .format(patchOrderProv.data.totalAmount),
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0.sp, 20.0.sp, 16.0.sp, 20.0.sp),
              child: SizedBox(
                height: 56.0.h,
                child: ElevatedButton(
                  onPressed: () {
                    final tabProvider =
                        Provider.of<TabProvider>(context, listen: false);

                    final NavBarProv =
                        Provider.of<NavBarProvider>(context, listen: false);
                    tabProvider.setInitialIndex(0);
                    NavBarProv.setSelectedIndex(1);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                      (route) =>
                          false, // Condition to remove all previous routes
                    );
                  },
                  child: Text(
                    'Cek Pesanan',
                    style: TextStyle(fontSize: 18.0.sp),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
