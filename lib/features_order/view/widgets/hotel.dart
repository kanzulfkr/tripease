import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:capstone_project_tripease/features_order/view/screens/features_order_details_hotel/view/order_refund_pending.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/coundown_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';

import '../../utils/images.dart';
import '../../view_model/provider/hotel/hotel_order_provider.dart';
import '../../view_model/provider/tab_provider.dart';
import '../screens/features_order_details_hotel/view/order_active.dart';
import '../screens/features_order_details_hotel/view/order_cancceled.dart';
import '../screens/features_order_details_hotel/view/order_pending.dart';
import '../screens/features_order_details_hotel/view/order_succes.dart';

class Hotel extends StatefulWidget {
  const Hotel({
    super.key,
  });

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder());
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  getFilteredCardHotels() {
    var providerHotel =
        Provider.of<HotelOrderProvider>(context, listen: false).tabStatusHotel;
    switch (providerHotel) {
      case TabStatusHotel.MENUNGGU:
        return Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder(status: 'unpaid');
      case TabStatusHotel.AKTIF:
        return Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder(status: 'paid');
      case TabStatusHotel.SELESAI:
        return Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder(status: 'done');
      case TabStatusHotel.DIBATALKAN:
        return Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder(status: 'canceled');
      case TabStatusHotel.PENGEMBALIAN:
        return Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder(status: 'refund');
      case TabStatusHotel.SEMUA:
      default:
        return Provider.of<HotelOrderProvider>(context, listen: false)
            .fetchHotelOrder(status: '');
    }
  }

  Color getIconColor(SvgPicture icon) {
    if (icon == iconCheck) {
      return green;
    } else if (icon == iconSchedule) {
      return kuning;
    } else if (icon == iconPesananSelesai) {
      return orange;
    } else if (icon == iconCencel) {
      return red;
    } else {
      return black;
    }
  }

  void navigateToDetailPage() {
    var detailHotel =
        Provider.of<HotelOrderProvider>(context, listen: false).tabStatusHotel;
    List<Widget> destinationPages = [];

    switch (detailHotel) {
      case TabStatusHotel.MENUNGGU:
        destinationPages.add(const OrderPending());
        break;
      case TabStatusHotel.AKTIF:
        destinationPages.add(const OrderActive());
        break;
      case TabStatusHotel.SELESAI:
        destinationPages.add(const OrderSucces());
        break;
      case TabStatusHotel.DIBATALKAN:
        destinationPages.add(const OrderCanccel());
        break;
      case TabStatusHotel.PENGEMBALIAN:
        destinationPages.add(const OrderRefundPending());
        break;
      case TabStatusHotel.SEMUA:
      default:
        return;
    }
    if (destinationPages.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return PageView(
            children: destinationPages,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context, listen: false);
    tabProvider.setActiveTabIndex(0);

    ScreenUtil.init(context);

    return Consumer<HotelOrderProvider>(
      builder: (context, hotelProvider, _) {
        return Container(
          color: background,
          child: DefaultTabController(
            length: 6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: background,
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.5),
                              spreadRadius: 1.w,
                              blurRadius: 5.w,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: ButtonsTabBar(
                            radius: 50.0.r,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            backgroundColor: mainBlue,
                            unselectedBackgroundColor: background,
                            labelStyle: myTextTheme.labelLarge,
                            unselectedLabelStyle: myTextTheme.labelMedium,
                            borderColor: grey,
                            borderWidth: .3.w,
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'Semua'),
                              Tab(text: 'Menunggu'),
                              Tab(text: 'Aktif'),
                              Tab(text: 'Selesai'),
                              Tab(text: 'Dibatalkan'),
                              Tab(text: 'Pengembalian'),
                            ],
                            onTap: (index) {
                              hotelProvider
                                  .changesTab(TabStatusHotel.values[index]);
                              getFilteredCardHotels();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Consumer<HotelOrderProvider>(
                    builder: (context, hotelOrderProvider, _) {
                      return ListView.builder(
                        itemCount: hotelOrderProvider.hotelOrder.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              navigateToDetailPage();
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: background,
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.5),
                                          spreadRadius: 1.w,
                                          blurRadius: 3.w,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    // height:205.h,
                                    width: 350.w,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              hotelProvider.hotelOrder[index]
                                                          .status ==
                                                      'unpaid'
                                                  ? iconSchedule
                                                  : hotelProvider
                                                              .hotelOrder[index]
                                                              .status ==
                                                          'paid'
                                                      ? iconCheck
                                                      : hotelProvider
                                                                  .hotelOrder[
                                                                      index]
                                                                  .status ==
                                                              'done'
                                                          ? iconPesananSelesai
                                                          : hotelProvider
                                                                      .hotelOrder[
                                                                          index]
                                                                      .status ==
                                                                  'canceled'
                                                              ? iconCencel
                                                              : iconSchedule,
                                              SizedBox(width: 5.w),
                                              Expanded(
                                                child: hotelProvider
                                                            .hotelOrder[index]
                                                            .status ==
                                                        'unpaid'
                                                    ? Text(
                                                        'MENUNGGU PEMBAYARAN',
                                                        style: myTextTheme
                                                            .titleLarge
                                                            ?.copyWith(
                                                          color: kuning,
                                                        ),
                                                      )
                                                    : hotelProvider
                                                                .hotelOrder[
                                                                    index]
                                                                .status ==
                                                            'paid'
                                                        ? Text(
                                                            'SUDAH BAYAR',
                                                            style: myTextTheme
                                                                .titleLarge
                                                                ?.copyWith(
                                                              color: green,
                                                            ),
                                                          )
                                                        : hotelProvider
                                                                    .hotelOrder[
                                                                        index]
                                                                    .status ==
                                                                'done'
                                                            ? Text(
                                                                'PESANAN SELESAI',
                                                                style: myTextTheme
                                                                    .titleLarge
                                                                    ?.copyWith(
                                                                  color: orange,
                                                                ),
                                                              )
                                                            : hotelProvider
                                                                        .hotelOrder[
                                                                            index]
                                                                        .status ==
                                                                    'canceled'
                                                                ? Text(
                                                                    'PESANAN DIBATALKAN',
                                                                    style: myTextTheme
                                                                        .titleLarge
                                                                        ?.copyWith(
                                                                      color:
                                                                          red,
                                                                    ),
                                                                  )
                                                                : Text(
                                                                    'DALAM PROSES PENGEMBALIAN',
                                                                    style: myTextTheme
                                                                        .titleLarge
                                                                        ?.copyWith(
                                                                      color:
                                                                          kuning,
                                                                    ),
                                                                  ),
                                              ),
                                              if (hotelProvider
                                                      .hotelOrder[index]
                                                      .status ==
                                                  'unpaid')
                                                Consumer<CountdownProvider>(
                                                  builder: (context,
                                                      timeProvider, _) {
                                                    return Expanded(
                                                      child: CountdownTimer(
                                                        endTime: timeProvider
                                                            .endTime,
                                                        textStyle: myTextTheme
                                                            .titleLarge
                                                            ?.copyWith(
                                                          color: getIconColor(
                                                              iconSchedule),
                                                        ),
                                                        onEnd: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                  'Waktu Habis',
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                    color:
                                                                        black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                content: Text(
                                                                  'Pesanan Dibatalkan',
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                    color:
                                                                        black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    child: Text(
                                                                      'Tutup',
                                                                      style: GoogleFonts
                                                                          .openSans(
                                                                        color:
                                                                            mainBlue,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          // setState(() {
                                                          // });
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                            ],
                                          ),
                                          SizedBox(height: 20.h),
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                child: SizedBox.fromSize(
                                                  size: Size.fromRadius(48.r),
                                                  child: shibuya,
                                                ),
                                              ),
                                              SizedBox(width: 20.w),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      hotelProvider
                                                              .hotelOrder[index]
                                                              .hotel
                                                              ?.name ??
                                                          '',
                                                      style: myTextTheme
                                                          .displayMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            iconLocation,
                                                            SizedBox(
                                                                width: 10.w),
                                                            Expanded(
                                                              child: Text(
                                                                hotelProvider
                                                                        .hotelOrder[
                                                                            index]
                                                                        .hotel
                                                                        ?.address ??
                                                                    '',
                                                                style: myTextTheme
                                                                    .headlineSmall,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            iconBed,
                                                            SizedBox(
                                                                width: 10.w),
                                                            Expanded(
                                                              child: Text(
                                                                'Exclusive Room',
                                                                style: myTextTheme
                                                                    .headlineSmall,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            iconBedTime,
                                                            SizedBox(
                                                                width: 10.w),
                                                            Expanded(
                                                              child: Text(
                                                                '${hotelProvider.hotelOrder[index].numberOfNight}',
                                                                style: myTextTheme
                                                                    .headlineSmall,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            iconDate,
                                                            SizedBox(
                                                                width: 10.w),
                                                            Expanded(
                                                              child: Text(
                                                                '${hotelProvider.hotelOrder[index].checkInDate} - ${hotelProvider.hotelOrder[index].checkOutDate}',
                                                                style: myTextTheme
                                                                    .headlineSmall,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.h),
                                          const Divider(
                                            color: black,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Nomor Pesanan :',
                                                  style: myTextTheme.bodySmall,
                                                ),
                                                SizedBox(width: 5.w),
                                                Expanded(
                                                  child: Text(
                                                    hotelProvider
                                                            .hotelOrder[index]
                                                            .ticketOrderCode
                                                            ?.toString() ??
                                                        '',
                                                    style:
                                                        myTextTheme.bodySmall,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
