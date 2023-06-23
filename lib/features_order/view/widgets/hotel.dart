import 'dart:async';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:capstone_project_tripease/features_order/view/screens/features_order_details_hotel/view/order_refund_pending.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/coundown_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../home.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';

import '../../utils/images.dart';
import '../../view_model/provider/hotel/hotel_order_provider.dart';
import '../../view_model/provider/hotel/hotel_order_update_provider.dart';
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
        destinationPages.add(const OrderCanccel());
        break;
      case TabStatusHotel.SEMUA:
        break;
      default:
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
                  child: ListView.builder(
                    itemCount: hotelProvider.hotelOrder.length,
                    itemBuilder: (context, index) {
                      DateTime checkIn =
                          hotelProvider.hotelOrder[index].checkInDate ??
                              DateTime.now();
                      DateTime checkOut =
                          hotelProvider.hotelOrder[index].checkInDate ??
                              DateTime.now();
                      initializeDateFormatting('id_ID', null);
                      String formattedDateCheckIn =
                          DateFormat.yMMMMd('id_ID').format(checkIn);
                      String formattedDateCheckOut =
                          DateFormat.yMMMMd('id_ID').format(checkOut);
                      return InkWell(
                        onTap: () {
                          var orderDetail =
                              Provider.of<HotelOrderDetailProvider>(context,
                                  listen: false);

                          var nameHotel =
                              hotelProvider.hotelOrder[index].hotel?.name ?? '';
                          orderDetail.setNameHotel(nameHotel);
                          var numberMattress = hotelProvider.hotelOrder[index]
                                  .hotel?.hotelRoom?.numberOfMattress ??
                              '';
                          orderDetail
                              .setNumberOfMattress(numberMattress.toString());
                          var addressHotel =
                              hotelProvider.hotelOrder[index].hotel?.address ??
                                  '';
                          orderDetail.setAddressHotel(addressHotel);
                          var classHotel = hotelProvider
                                  .hotelOrder[index].hotel?.hotelClass ??
                              '';
                          orderDetail.setClassHotel(classHotel.toString());
                          var numberOfNight =
                              hotelProvider.hotelOrder[index].numberOfNight ??
                                  '';
                          orderDetail
                              .setNumberOfNight(numberOfNight.toString());
                          var checkIn =
                              hotelProvider.hotelOrder[index].checkInDate ?? '';
                          final formatDate = DateFormat('dd MMMM yyyy');
                          String formattedCheckIn = formatDate
                              .format(DateTime.parse(checkIn.toString()));
                          orderDetail.setCheckIn(formattedCheckIn);
                          var checkOut =
                              hotelProvider.hotelOrder[index].checkOutDate ??
                                  '';
                          String formattedCheckOut = formatDate
                              .format(DateTime.parse(checkOut.toString()));
                          orderDetail.setCheckOut(formattedCheckOut);
                          var typePayment =
                              hotelProvider.hotelOrder[index].payment?.type ??
                                  '';
                          orderDetail.setTypePayment(typePayment);
                          var accountNumber = hotelProvider
                                  .hotelOrder[index].payment?.accountNumber ??
                              '';
                          orderDetail.setAccountNumber(accountNumber);

                          var accountName = hotelProvider
                                  .hotelOrder[index].payment?.accountName ??
                              '';
                          orderDetail.setAccountName(accountName);

                          var imagePayment = hotelProvider
                                  .hotelOrder[index].payment?.imageUrl ??
                              '';
                          orderDetail.setImagePayment(imagePayment);

                          var ticketOrderCode =
                              hotelProvider.hotelOrder[index].ticketOrderCode ??
                                  '';
                          orderDetail.setTicketOrderCode(ticketOrderCode);
                          var nameOrder =
                              hotelProvider.hotelOrder[index].nameOrder ?? '';
                          orderDetail.setNameOrder(nameOrder);
                          var nameRoomHotel = hotelProvider
                                  .hotelOrder[index].hotel?.hotelRoom?.name ??
                              '';
                          orderDetail.setNameRoomHotel(nameRoomHotel);
                          var emailOrder =
                              hotelProvider.hotelOrder[index].emailOrder ?? '';
                          orderDetail.setEmailOrder(emailOrder);
                          var specialRequest =
                              hotelProvider.hotelOrder[index].specialRequest ??
                                  '';
                          orderDetail.setSpecialRequest(specialRequest);
                          var hotelFacilities = hotelProvider
                                  .hotelOrder[index].hotel?.hotelFacilities ??
                              '';

                          orderDetail
                              .setHotelFacilities(hotelFacilities.toString());
                          var numberOfGuest = hotelProvider.hotelOrder[index]
                                  .hotel?.hotelRoom?.numberOfGuest ??
                              '';
                          orderDetail
                              .setNumberOfGuest(numberOfGuest.toString());
                          var quantityOfRoom = hotelProvider.hotelOrder[index]
                                  .hotel?.hotelRoom?.quantityOfRoom ??
                              '';
                          orderDetail
                              .setQuantityRoom(quantityOfRoom.toString());
                          var priceHotel =
                              hotelProvider.hotelOrder[index].price ?? '';
                          final formatCurrency = NumberFormat.currency(
                              locale: 'id_ID', symbol: 'Rp ');
                          String formattedPrice = formatCurrency
                              .format(double.parse(priceHotel.toString()));
                          orderDetail.setPriceHotel(formattedPrice);

                          var totalAmount =
                              hotelProvider.hotelOrder[index].totalAmount ?? '';
                          String formattedTotalAmount = formatCurrency
                              .format(double.parse(totalAmount.toString()));
                          orderDetail.setTotalAmount(formattedTotalAmount);

                          var discountPrice = hotelProvider.hotelOrder[index]
                                  .hotel?.hotelRoom?.discountPrice ??
                              '';
                          String formattedDiscount = formatCurrency
                              .format(double.parse(discountPrice.toString()));
                          orderDetail.setDiscountPrice(formattedDiscount);

                          var hotelOrderId =
                              hotelProvider.hotelOrder[index].hotelOrderId;
                          orderDetail.setHotelOrderId(hotelOrderId);

                          var createAt =
                              hotelProvider.hotelOrder[index].createdAt ?? '';
                          final formatDateOrderCheck =
                              DateFormat('dd MMMM yyyy HH:mm:ss');
                          String formattedCreateAt = formatDateOrderCheck
                              .format(DateTime.parse(createAt.toString()));
                          orderDetail.setCreatedAt(formattedCreateAt);

                          var updateAt =
                              hotelProvider.hotelOrder[index].updatedAt ?? '';
                          final formatDateOrderUpdate =
                              DateFormat('dd MMMM yyyy HH:mm:ss');
                          String formattedUpdateAt = formatDateOrderUpdate
                              .format(DateTime.parse(updateAt.toString()));
                          orderDetail.setUpdatedAt(formattedUpdateAt);

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
                                              : hotelProvider.hotelOrder[index]
                                                          .status ==
                                                      'paid'
                                                  ? iconCheck
                                                  : hotelProvider
                                                              .hotelOrder[index]
                                                              .status ==
                                                          'done'
                                                      ? iconPesananSelesai
                                                      : hotelProvider
                                                                  .hotelOrder[
                                                                      index]
                                                                  .status ==
                                                              'canceled'
                                                          ? iconCencel
                                                          : iconCencel,
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
                                                            .hotelOrder[index]
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
                                                                  color: red,
                                                                ),
                                                              )
                                                            : Text(
                                                                'PESANAN DIBATALKAN',
                                                                style: myTextTheme
                                                                    .titleLarge
                                                                    ?.copyWith(
                                                                  color: red,
                                                                ),
                                                              ),
                                          ),
                                          if (hotelProvider
                                                  .hotelOrder[index].status ==
                                              'unpaid')
                                            Consumer<CountdownProvider>(
                                              builder:
                                                  (context, timeProvider, _) {
                                                return Expanded(
                                                  child: CountdownTimer(
                                                      endTime:
                                                          timeProvider.endTime,
                                                      textStyle: myTextTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                        color: getIconColor(
                                                            iconSchedule),
                                                      ),
                                                      onEnd: () {
                                                        var orderProvider = Provider
                                                            .of<StatusOrderHotelUpdateProvider>(
                                                                context,
                                                                listen: false);

                                                        int? hotelOrderId =
                                                            hotelProvider
                                                                .hotelOrder[
                                                                    index]
                                                                .hotelOrderId;
                                                        String status =
                                                            'canceled';

                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                'Waktu Habis',
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  color: black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              content: Text(
                                                                'Pesanan Dibatalkan',
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  color: black,
                                                                  fontSize: 12,
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
                                                                          FontWeight
                                                                              .w600,
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
                                                        ).then((value) {
                                                          orderProvider
                                                              .updateOrderStatus(
                                                                  hotelOrderId,
                                                                  status);
                                                          _tabController
                                                              ?.animateTo(4);
                                                        });
                                                      }),
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
                                                  style:
                                                      myTextTheme.displayMedium,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                SizedBox(height: 10.h),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        iconLocation,
                                                        SizedBox(width: 10.w),
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
                                                        SizedBox(width: 10.w),
                                                        Expanded(
                                                          child: Text(
                                                            hotelProvider
                                                                    .hotelOrder[
                                                                        index]
                                                                    .hotel
                                                                    ?.hotelRoom
                                                                    ?.name ??
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
                                                        iconBedTime,
                                                        SizedBox(width: 10.w),
                                                        Expanded(
                                                          child: Text(
                                                            '${hotelProvider.hotelOrder[index].numberOfNight} Night',
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
                                                        SizedBox(width: 10.w),
                                                        Expanded(
                                                          child: Text(
                                                            '$formattedDateCheckIn - $formattedDateCheckOut',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nomor Pesanan :',
                                              style: myTextTheme.bodySmall,
                                            ),
                                            SizedBox(width: 5.w),
                                            Expanded(
                                              child: Text(
                                                hotelProvider.hotelOrder[index]
                                                        .ticketOrderCode
                                                        ?.toString() ??
                                                    '',
                                                style: myTextTheme.bodySmall,
                                                overflow: TextOverflow.ellipsis,
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
