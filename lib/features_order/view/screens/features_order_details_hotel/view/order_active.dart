import '/features_order/utils/colors.dart';
import '/features_order/utils/icons.dart';
import '/features_order/utils/images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../utils/fonts.dart';
import '../../../../view_model/provider/hotel/hotel_order_detail_provider.dart';
import '../../../../view_model/provider/hotel/hotel_order_update_provider.dart';
import '../../../widgets/hotel_star_rating.dart';
import '../features_checkin_checkout/component/button_active.dart';
import '../features_checkin_checkout/component/button_close.dart';

import '../features_checkin_checkout/check_in.dart';
import 'order_cancceled.dart';

class OrderActive extends StatefulWidget {
  const OrderActive({super.key});

  @override
  State<OrderActive> createState() => _OrderActiveState();
}

class _OrderActiveState extends State<OrderActive> {
  late bool _customIcon1 = false;
  late bool _customIcon2 = false;
  late bool _customIcon3 = false;
  late bool _customIcon4 = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rincian Pesanan',
          style: myTextTheme.headlineLarge,
        ),
        centerTitle: false,
      ),
      body: Consumer<HotelOrderDetailProvider>(
        builder: (context, orderDetail, _) {
          return ListView(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Container(
                    width: 350.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: success,
                      borderRadius: BorderRadius.circular(8.0.r),
                      border: Border.all(color: green),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Row(
                        children: [
                          iconSuccess,
                          SizedBox(width: 10.w),
                          Text(
                            'Pesananmu Sudah Bayar',
                            style: GoogleFonts.openSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  color: background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      shibuya,
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          left: 10.w,
                          right: 10.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.w,
                              ),
                              child: Text(
                                orderDetail.getNameHotel ?? '',
                                style: myTextTheme.displayMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5.h,
                                left: 10.w,
                              ),
                              child: Text(
                                orderDetail.getAddressHotel ?? '',
                                style: myTextTheme.headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                left: 10.w,
                                bottom: 10.h,
                              ),
                              child: HotelStarRating(
                                  int.parse(orderDetail.getClassHotel ?? '')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  width: 350.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(8.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.w,
                        blurRadius: 1.w,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        iconMaps,
                        SizedBox(width: 40.w),
                        Text(
                          'Lihat Di Map',
                          style: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.w,
                        blurRadius: 1.w,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Card(
                    color: background,
                    shadowColor: grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      leading: iconInfo,
                      title: Text(
                        'Informasi Pesanan',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      trailing: _customIcon1
                          ? const Icon(
                              Icons.expand_less_rounded,
                              color: mainBlue,
                            )
                          : const Icon(
                              Icons.expand_more_rounded,
                              color: mainBlue,
                            ),
                      onExpansionChanged: (bool value) {
                        setState(() {
                          _customIcon1 = value;
                        });
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(child: Text("Nomor Pesanan")),
                              Expanded(
                                child: Text(
                                  orderDetail.getTicketOrderCode ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Nama Pemesan"),
                              Text(orderDetail.getNameOrder ?? ''),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Jenis Kamar"),
                              Text(orderDetail.getNameRoomHotel ?? ''),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Email"),
                              Text(orderDetail.getEmailOrder ?? ''),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.w,
                        blurRadius: 1.w,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Card(
                    color: background,
                    shadowColor: grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      leading: iconformat,
                      title: Text(
                        'Permintaan Khusus',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      trailing: _customIcon2
                          ? const Icon(
                              Icons.expand_less_rounded,
                              color: mainBlue,
                            )
                          : const Icon(
                              Icons.expand_more_rounded,
                              color: mainBlue,
                            ),
                      onExpansionChanged: (bool value) {
                        setState(() {
                          _customIcon2 = value;
                        });
                      },
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(orderDetail.getSpecialRequest ?? ''),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.w,
                        blurRadius: 1.w,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Card(
                    color: background,
                    shadowColor: grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      title: Text(
                        'Detail Pesanan',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      trailing: _customIcon3
                          ? const Icon(
                              Icons.expand_less_rounded,
                              color: mainBlue,
                            )
                          : const Icon(
                              Icons.expand_more_rounded,
                              color: mainBlue,
                            ),
                      onExpansionChanged: (bool value) {
                        setState(() {
                          _customIcon3 = value;
                        });
                      },
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    bottom: 20.h,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10.r), // Image border
                                    child: SizedBox.fromSize(
                                      size:
                                          Size.fromRadius(35.r), // Image radius
                                      child: Image.asset(
                                          'assets/images/shibuya.png',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderDetail.getNameHotel ?? '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        'Street View | No Smoking | ${orderDetail.getQuantityOfRoom ?? ''}',
                                        style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Single Bed',
                                        style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 30.h),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                  ),
                                  child: Text(
                                    'Benefits :',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    bottom: 10.h,
                                  ),
                                  child: Text(
                                    orderDetail.getHotelFacilities ?? '',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.w,
                        blurRadius: 1.w,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Card(
                    color: background,
                    shadowColor: grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      title: Text(
                        'Informasi Pembayaran',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      trailing: _customIcon4
                          ? const Icon(
                              Icons.expand_less_rounded,
                              color: mainBlue,
                            )
                          : const Icon(
                              Icons.expand_more_rounded,
                              color: mainBlue,
                            ),
                      onExpansionChanged: (bool value) {
                        setState(() {
                          _customIcon4 = value;
                        });
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${orderDetail.getNumberOfGuest ?? ''} Kamar x ${orderDetail.getNumberOfNight ?? ''} Malam"),
                              Text(orderDetail.getPriceHotel ?? ''),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Promo"),
                              Text(orderDetail.getDiscountPrice ?? ''),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Metode Pembayaran"),
                              SizedBox(
                                width: 50.w,
                                child: Image.network(
                                    orderDetail.getImagePayment ?? ''),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Harga",
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                orderDetail.getTotalAmount ?? '',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(350.w, 50.h),
                    ),
                  ),
                  child: Text(
                    'Dapatkan Konfirmasi Pesanan',
                    style: myTextTheme.headlineMedium,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckIn(
                        title: orderDetail.getNameHotel ?? '',
                      ),
                    ));
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      buttons,
                    ),
                    fixedSize: MaterialStatePropertyAll(
                      Size(350.w, 50.h),
                    ),
                  ),
                  child: Text(
                    'Batalkan Pesanan',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: mainBlue,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Apakah Anda yakin ingin membatalkan pesanan?',
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 132.w,
                                  child: ButtonClose(
                                    text: 'Ya',
                                    onTap: () {
                                      var orderProvider = Provider.of<
                                              StatusOrderHotelUpdateProvider>(
                                          context,
                                          listen: false);
                                      int? hotelOrderId =
                                          orderDetail.getHotelOrderId;
                                      String status = 'canceled';

                                      orderProvider.updateOrderStatus(
                                          hotelOrderId!, status);

                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderCanccel(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                SizedBox(
                                  width: 132.w,
                                  child: ButtonActive(
                                    text: 'Tidak',
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: null,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      buttons,
                    ),
                    fixedSize: MaterialStatePropertyAll(
                      Size(350.w, 50.h),
                    ),
                  ),
                  child: Text(
                    'Kembali ke Beranda',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: mainBlue,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        },
      ),
    );
  }
}
