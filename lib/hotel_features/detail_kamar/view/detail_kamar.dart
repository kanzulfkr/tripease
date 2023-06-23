import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../detail_hotel/viewmodel/detail_hotel_provider.dart';
import '../../hotel_home/viewmodel/search_hotel_provider.dart';
import '../../input_guest/view/input_guest_view.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../viewmodel/hotel_room_detail_provider.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  RoomPageState createState() => RoomPageState();
}

class RoomPageState extends State<RoomPage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // final roomDetail =
  //   //     Provider.of<DetailHotelRoomProvider>(context, listen: false);
  //   // final detailHotelProv =
  //   //     Provider.of<DetailHotelProvider>(context, listen: false);

  //   // Future.microtask(() async {
  //   //   await roomDetail.getDetailHotelRoom(detailHotelProv
  //   //       .detailHotel
  //   //       .hotelRoom?[roomDetail.selectedHotelRoomIndex as int]
  //   //       .hotelRoomId as int);
  //   // });
  // }

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kamar'),
        centerTitle: true,
      ),
      body: Consumer<DetailHotelRoomProvider>(
        builder: (context, detailRoom, child) {
          List<String> images = [
            'assets/images/detail_k1.jpeg',
            'assets/images/detail_k2.jpeg',
            'assets/images/detail_k3.jpeg'
          ];
          final detailHotelProv =
              Provider.of<DetailHotelProvider>(context, listen: false);

          final detailHotelRoom = Provider.of<DetailHotelRoomProvider>(context);
          bool isFacilityAvailable(String facilityName) {
            return detailHotelRoom.detailHotelRoom.hotelRoomFacility!
                .any((facility) => facility.name == facilityName);
          }

          bool isWifiAvailable = isFacilityAvailable("Wifi");
          bool isBreakFastAvailable = isFacilityAvailable("Breakfast");
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.h),
                SizedBox(
                  height: 192.h,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        detailRoom.detailHotelRoom.hotelRoomImage?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: detailRoom.detailHotelRoom.hotelRoomImage![index]
                                        .imageUrl! !=
                                    "string" &&
                                detailRoom.detailHotelRoom
                                        .hotelRoomImage?[index].imageUrl! !=
                                    null &&
                                detailRoom.detailHotelRoom
                                        .hotelRoomImage![index].imageUrl! !=
                                    "h.png" &&
                                detailRoom.detailHotelRoom
                                        .hotelRoomImage![index].imageUrl! !=
                                    "c.jpg"
                            ? Image.network(
                                detailRoom.detailHotelRoom
                                    .hotelRoomImage![index].imageUrl!,
                              )
                            : Image.asset(images[index]),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      detailRoom.detailHotelRoom.name
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        letterSpacing: 0.04,
                                      ),
                                    ),
                                    Text(
                                      '${formatter.format(detailRoom.detailHotelRoom.normalPrice)}/Malam',
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
                                          '${detailRoom.detailHotelRoom.numberOfGuest} Tamu',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            letterSpacing: 0.04,
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
                                          '${detailRoom.detailHotelRoom.numberOfMattress}  ${detailRoom.detailHotelRoom.mattressSize} ',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            letterSpacing: 0.04,
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
                                        isBreakFastAvailable == true
                                            ? Row(
                                                children: [
                                                  const Icon(Icons.restaurant),
                                                  SizedBox(
                                                    width: 14.w,
                                                  ),
                                                  Text(
                                                    'Breakfast',
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
                                        Row(
                                          children: [
                                            const Icon(Icons.credit_card),
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
                                                      'Wifi',
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
                                                      'No Wifi',
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
                                        //       SizedBox(
                                        //         width: 14,
                                        //       ),
                                        //       Text(
                                        //         widget.room.reSchedule,
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
                                    Row(
                                      children: [
                                        const Icon(Icons.smoke_free),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          detailHotelProv.detailHotel
                                                      .hotelPolicy?.isSmoking ==
                                                  true
                                              ? 'Boleh Merokok'
                                              : 'Dilarang Merokok',
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
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Text(
                                      'Deskripsi Kamar',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        letterSpacing: 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(
                                          0xFF0080FF), // #0080FF hex color
                                      width: 2.0.w, // border width
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // border radius
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0.sp),
                                    child: Column(
                                      children: [
                                        Text(
                                          detailRoom.detailHotelRoom.description
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            letterSpacing: 0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Fasilitas Kamar',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            letterSpacing: 0.025,
                                          ),
                                        )
                                      ],
                                    ),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 3.5,
                                      ),
                                      itemCount: detailRoom.detailHotelRoom
                                          .hotelRoomFacility?.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            const Icon(
                                                Icons.check_circle_sharp),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            Text(
                                              detailRoom
                                                      .detailHotelRoom
                                                      .hotelRoomFacility?[index]
                                                      .name
                                                      .toString() ??
                                                  '',
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                                letterSpacing: 0.04,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0.sp, 20.0.sp, 16.0.sp, 20.0.sp),
          child: SizedBox(
            height: 56.0.h,
            child: ElevatedButton(
              onPressed: () {
                final searchProv =
                    Provider.of<SearchProvider>(context, listen: false);
                final detailProv = Provider.of<DetailHotelRoomProvider>(context,
                    listen: false);

                if (searchProv.jumlahDewasa ==
                        detailProv.detailHotelRoom.numberOfGuest ||
                    (searchProv.jumlahDewasa ?? 0) <
                        (detailProv.detailHotelRoom.numberOfGuest ?? 0)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InputGuestPage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Jumlah tamu tidak sesuai',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: 0.025,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text(
                'Pilih',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  letterSpacing: 0.04,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
