import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hotel_1/hotel_features/detail_hotel/model/detail_hotel.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../detail_kamar/view/detail_kamar.dart';
import '../../detail_kamar/viewmodel/hotel_room_detail_provider.dart';
import '../../hotel_home/viewmodel/search_hotel_provider.dart';
import '../model/detail_hotel_model.dart';
import '../viewmodel/detail_hotel_provider.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  void initState() {
    super.initState();
    final searchProv = Provider.of<SearchProvider>(context, listen: false);
    Future.microtask(() async =>
        await Provider.of<DetailHotelProvider>(context, listen: false)
            .getDetailHotel(searchProv
                .hotel[searchProv.selectedHotelIndex as int].hotelId as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Hotel'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<DetailHotelProvider>(
          builder: (context, detailHotelProv, _) {
            return Column(
              children: [
                SizedBox(height: 12.h),
                CarouselSlider.builder(
                  itemCount:
                      detailHotelProv.detailHotel.hotelImage?.length ?? 0,
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, _) {
                      setState(() {});
                    },
                  ),
                  itemBuilder: (BuildContext context, int index, _) {
                    return SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: detailHotelProv.detailHotel.hotelImage?[index]
                                        .imageUrl !=
                                    "string" &&
                                detailHotelProv.detailHotel.hotelImage?[index]
                                        .imageUrl !=
                                    null &&
                                detailHotelProv.detailHotel.hotelImage?[index]
                                        .imageUrl !=
                                    "h.png" &&
                                detailHotelProv.detailHotel.hotelImage?[index]
                                        .imageUrl !=
                                    "c.jpg" &&
                                detailHotelProv.detailHotel.hotelImage?[index]
                                        .imageUrl !=
                                    "m.jpg"
                            ? Image.network(
                                detailHotelProv.detailHotel.hotelImage?[index]
                                        .imageUrl ??
                                    'https://res.cloudinary.com/dt3wofhpk/image/upload/v1687104505/go-cloudinary/hak3nom2ipxpaff6citr.png',
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                hotelAssetsList[index],
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0.w, color: Colors.grey),
                            bottom:
                                BorderSide(width: 1.0.w, color: Colors.grey),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    detailHotelProv.detailHotel.name ?? '',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.025.sp),
                                  ),
                                  // RatingBar.builder(
                                  //   initialRating: detailHotelProv
                                  //           .detailHotel.dataClass
                                  //           ?.toDouble() ??
                                  //       0,
                                  //   minRating: 1,
                                  //   direction: Axis.horizontal,
                                  //   allowHalfRating: true,
                                  //   itemCount: 5,
                                  //   itemSize: 16,
                                  //   itemPadding:
                                  //       EdgeInsets.symmetric(horizontal: 0.5),
                                  //   itemBuilder: (context, _) => Icon(
                                  //     Icons.star,
                                  //     color: Colors.amber,
                                  //   ),
                                  //   onRatingUpdate: (rating) {
                                  //     print(rating);
                                  //   },
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              RatingBarIndicator(
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                rating: detailHotelProv.detailHotel.dataClass
                                        ?.toDouble() ??
                                    0,
                                itemCount: detailHotelProv.detailHotel.dataClass
                                        ?.toInt() ??
                                    0,
                                itemSize: 12.0,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          detailHotelProv.detailHotel.address ??
                                              '',
                                          style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.04.sp),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
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
                        child: ExpansionTile(
                          title: Text(
                            'Tentang Hotel',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.04.sp),
                          ),
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
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
                                                      color: Colors.blueAccent,
                                                    ),
                                                    SizedBox(
                                                      width: 12.w,
                                                    ),
                                                    Text(
                                                      amenity.name.toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 0.04.sp,
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
                                      children:
                                          detailHotelProv
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
                                                                  Row(
                                                                    children: [
                                                                      RatingBar
                                                                          .builder(
                                                                        initialRating:
                                                                            review.rating?.toDouble() ??
                                                                                0,
                                                                        minRating:
                                                                            1,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        allowHalfRating:
                                                                            true,
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            16,
                                                                        itemPadding:
                                                                            EdgeInsets.symmetric(horizontal: 0.5.sp),
                                                                        itemBuilder:
                                                                            (context, _) =>
                                                                                const Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Colors.amber,
                                                                        ),
                                                                        onRatingUpdate:
                                                                            (rating) {
                                                                          debugPrint(
                                                                              rating.toString());
                                                                        },
                                                                      )
                                                                    ],
                                                                  )
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
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F8),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.1,
                          ),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            'Kebijakan',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.025.sp),
                          ),
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
                              child: Column(
                                children: [
                                  Container(
                                      // child: Column(
                                      //   children:
                                      //     viewModel.htl.policies.map((policy) => Padding(
                                      //       padding: EdgeInsets.only(right: 0),
                                      //       child: Column(
                                      //         children: [
                                      //           Container(
                                      //             child: Row(
                                      //               children: [
                                      //                 Text(
                                      //                   policy.type,
                                      //                   style: TextStyle(
                                      //                     fontFamily: 'Open Sans',
                                      //                     fontWeight: FontWeight.w500,
                                      //                     fontSize: 14,
                                      //                     letterSpacing: 0.025,
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(height: 10,),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //           SizedBox(height: 12,),
                                      //           Container(
                                      //             padding: EdgeInsets.only(left: 20),
                                      //             child: Column(
                                      //               crossAxisAlignment: CrossAxisAlignment.start,
                                      //               children: policy.desc.map((deskripsi) => Padding(
                                      //                 padding: EdgeInsets.only(right: 0),
                                      //                 child: Column(
                                      //                   children: [
                                      //                     Text(
                                      //                       deskripsi,
                                      //                       style: TextStyle(
                                      //                         fontFamily: 'Open Sans',
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(height: 10,),
                                      //                   ],
                                      //                 ),
                                      //               )).toList()
                                      //             ),
                                      //           )
                                      //         ],
                                      //       )
                                      //     ),
                                      //   ).toList(),
                                      // ),
                                      ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Tipe Kamar',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 0.025,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                          padding: EdgeInsets.all(12.0.sp),
                          child: Column(
                            children:
                                (detailHotelProv.detailHotel.hotelRoom ?? [])
                                    .asMap()
                                    .entries
                                    .map<Widget>((entry) {
                              final int index = entry.key;
                              final room = entry.value;

                              List<String> imagesRoom = [
                                'assets/images/detail_k1.jpeg',
                                'assets/images/detail_k2.jpeg',
                                'assets/images/detail_k3.jpeg'
                              ];
                              final detailHotelRoom =
                                  Provider.of<DetailHotelRoomProvider>(context);
                              bool isFacilityAvailable(String facilityName) {
                                return detailHotelProv.detailHotel
                                    .hotelRoom![index].hotelRoomFacility!
                                    .any((facility) =>
                                        facility.name == facilityName);
                              }

                              bool isWifiAvailable =
                                  isFacilityAvailable('Wifi');
                              bool isBreakfastAvailable =
                                  isFacilityAvailable('Breakfast');

                              return InkWell(
                                  onTap: () async {
                                    debugPrint('Selected index: $index');
                                    final roomDetail =
                                        Provider.of<DetailHotelRoomProvider>(
                                            context,
                                            listen: false);
                                    roomDetail.setSelectedHotelRoomIndex(index);

                                    await roomDetail.getDetailHotelRoom(
                                        detailHotelProv
                                            .detailHotel
                                            .hotelRoom?[roomDetail
                                                .selectedHotelRoomIndex as int]
                                            .hotelRoomId as int);

                                    if (context.mounted) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RoomPage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          room.name.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            letterSpacing: 0.04,
                                          ),
                                        ),
                                        Text(
                                          '${formatter.format(room.normalPrice)}/malam',
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
                                        children: room.hotelRoomImage!
                                            .map(
                                              (HotelRoomImage? image) =>
                                                  Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.sp),
                                                child: SizedBox(
                                                  width: 110.w,
                                                  height: 59.h,
                                                  child:
                                                      image?.imageUrl !=
                                                                  "string" &&
                                                              image?.imageUrl !=
                                                                  null &&
                                                              image?.imageUrl !=
                                                                  "h.png" &&
                                                              image?.imageUrl !=
                                                                  "c.jpg"
                                                          ? Image.network(image!
                                                              .imageUrl
                                                              .toString())
                                                          : Image.asset(
                                                              'assets/images/detail_k3.jpeg'),
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
                                              room.numberOfGuest.toString(),
                                              style: GoogleFonts.openSans(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.04.sp),
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
                                              '${room.numberOfMattress} ${room.mattressSize.toString()}',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.04.sp),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: isBreakfastAvailable ==
                                                          true
                                                      ? Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .breakfast_dining),
                                                            SizedBox(
                                                              width: 14.w,
                                                            ),
                                                            Text(
                                                              "Breakfast",
                                                              style: GoogleFonts.openSans(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      0.04.sp),
                                                            )
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .breakfast_dining),
                                                            SizedBox(
                                                              width: 14.w,
                                                            ),
                                                            Text(
                                                              "No Breakfast",
                                                              style: GoogleFonts.openSans(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      0.04.sp),
                                                            )
                                                          ],
                                                        ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.credit_card),
                                                    SizedBox(
                                                      width: 14.w,
                                                    ),
                                                    Text(
                                                      detailHotelProv
                                                                  .detailHotel
                                                                  .hotelPolicy
                                                                  ?.isPolicyCanceled ==
                                                              true
                                                          ? 'Refundable'
                                                          : 'No Refundable',
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
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: isWifiAvailable == true
                                                      ? Row(
                                                          children: [
                                                            const Icon(
                                                                Icons.wifi),
                                                            SizedBox(
                                                              width: 14.w,
                                                            ),
                                                            Text(
                                                              "Wifi",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.04.sp,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            const Stack(
                                                              children: [
                                                                Icon(
                                                                    Icons.wifi),
                                                                Icon(
                                                                    Icons.close)
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 14.w,
                                                            ),
                                                            Text(
                                                              "No Wifi",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.04.sp,
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
                                                //       Text(room.reSchedule,
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
                                            detailHotelProv
                                                        .detailHotel
                                                        .hotelPolicy
                                                        ?.isSmoking ==
                                                    false
                                                ? Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.smoke_free),
                                                      SizedBox(
                                                        width: 14.w,
                                                      ),
                                                      Text(
                                                        'Dilarang Merokok',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
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
                                                      const Icon(
                                                          Icons.smoking_rooms),
                                                      SizedBox(
                                                        width: 14.w,
                                                      ),
                                                      Text(
                                                        'Diperbolehkan Merokok',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.sp,
                                                          letterSpacing: 0.04,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        )
                                      ],
                                    ),
                                  ]));
                            }).toList(),
                          ))
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
