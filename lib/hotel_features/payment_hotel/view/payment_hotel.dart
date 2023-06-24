import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../detail_kamar/viewmodel/hotel_room_detail_provider.dart';
import '../../hotel_home/model/hotel_home_model.dart';
import '../../hotel_home/viewmodel/search_hotel_provider.dart';
import '../../input_guest/viewmodel/input_guest_provider.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_result/view/minimarket_result.dart';
import '../../payment_result/view/payment_result.dart';
import '../../payment_result/view/va_result.dart';
import '../../payment_result/viewmodel/payment_result_viewmodel.dart';
import '../model/order_model.dart';
import '../model/payment_model.dart';
import '../model/payment_page_model.dart';
import '../viewmodel/order_viewmodel.dart';
import '../viewmodel/payment_hotel_viewmodel.dart';
import '../viewmodel/payment_viewmodel.dart';

class PaymentPageHotel extends StatefulWidget {
  const PaymentPageHotel({super.key});

  @override
  State<PaymentPageHotel> createState() => _PaymentPageHotelState();
}

class _PaymentPageHotelState extends State<PaymentPageHotel> {
  String? paymentMethod;
  List<PaymentMethod> paymentMethods = [
    PaymentMethod('Kartu Kredit', 'assets/images/CC.jpeg', ['A', 'B'], ''),
    PaymentMethod('Virtual Account', 'assets/images/VA.jpeg', ['C', 'D'], ''),
    PaymentMethod('OVO', 'assets/images/OVO.jpeg', ['E', 'F'], 'Total Biaya'),
    PaymentMethod(
        'Gopay', 'assets/images/Gopay.jpeg', ['G', 'H'], 'Total Biaya'),
    PaymentMethod(
        'Minimarket', 'assets/images/Minimarket.jpeg', ['I', 'J'], ''),
    PaymentMethod('Bayar di Hotel', 'assets/images/Hotel.jpeg', ['K', 'L'],
        'Total Biaya'),
  ];
  Datum? selectedVirtualAccountOption;
  Datum? selectedMinimarketOption;
  late Timer _timer;
  int _secondsRemaining = 300;
  // String? getVirtualAccountOptionTitle() {
  //   if (paymentMethod == 'Virtual Account' &&
  //       selectedVirtualAccountOption != null) {
  //     return selectedVirtualAccountOption!.id;
  //   }
  //   return '';
  // }

  String? getMinimarketOptionTitle() {
    if (paymentMethod == 'Minimarket' && selectedMinimarketOption != null) {
      return selectedMinimarketOption!.type;
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent further executions
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
        showPopup();
      }
    });
  }

  void navigateToPaymentResultPage() async {
    final paymentProv =
        Provider.of<PaymentHotelProvider>(context, listen: false);
    final orderProv = Provider.of<OrderProviderHotel>(context, listen: false);
    final inputData = Provider.of<InputGuestProvider>(context, listen: false);
    final searchProv = Provider.of<SearchProvider>(context, listen: false);
    final dateProv = Provider.of<DateProvider>(context, listen: false);
    final detailPaymentProv =
        Provider.of<DetailPaymentProvider>(context, listen: false);
    final roomProv =
        Provider.of<DetailHotelRoomProvider>(context, listen: false);
    int? paymentId = paymentProv.paymentId;
    String? paymentType = paymentProv.paymentType;
    await detailPaymentProv.getDetailPayment(paymentProv.paymentId);
    if (paymentType == 'Virtual Account' && paymentId != 0) {
      PostOrderModel order = PostOrderModel(
        dateEnd: DateTime(dateProv.checkOutDate!.year,
            dateProv.checkOutDate!.month, dateProv.checkOutDate!.day),
        dateStart: DateTime(dateProv.checkInDate!.year,
            dateProv.checkInDate!.month, dateProv.checkInDate!.day),
        emailOrder: inputData.orderEmail,
        hotelRoomId: roomProv.detailHotelRoom.hotelRoomId,
        nameOrder: inputData.orderName,
        paymentId: paymentId,
        phoneNumberOrder: inputData.orderPhone,
        quantityAdult: searchProv.jumlahDewasa,
        quantityInfant: searchProv.jumlahAnak ?? 0,
        specialRequest: inputData.request ?? '',
        travelerDetail: inputData.travelerDetail,
      );
      await orderProv.postOrderHotel(order);
      debugPrint('ID ORDER :${orderProv.data.hotelOrderId}');
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const VirtualAccountPage(),
          ),
        );
      }
    } else if (paymentType == 'Minimarket' && paymentId != 0) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MinimarketPage(),
          ),
        );
      }
    } else {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentResultPage(),
          ),
        );
      }
    }
  }

  void showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Waktu Pembayaran Habis'),
          content: const Text('Silakan kembali ke halaman sebelumnya.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    final hotelRoomProv = Provider.of<DetailHotelRoomProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Waktu Pembayaran',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          letterSpacing: 0.04,
                        ),
                      ),
                      Text(
                        formatTime(_secondsRemaining),
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
                    height: 9.h,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 48.sp),
                        child: Row(
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
                              formatter.format(
                                  hotelRoomProv.detailHotelRoom.normalPrice),
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                letterSpacing: 0.025,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      // Container(
                      //   child: Row(
                      //     children: [
                      //       Checkbox(
                      //         value: widget.room.isChecked,
                      //         onChanged: (bool? value) {
                      //           setState(() {
                      //             widget.room.isChecked = value ?? false;
                      //           });
                      //         },
                      //       ),
                      //       Container(
                      //         width: 322,
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               'Asuransi',
                      //               style: TextStyle(
                      //                 fontFamily: 'Open Sans',
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 14,
                      //                 letterSpacing: 0.025,
                      //                 color: widget.room.isChecked
                      //                     ? Colors.black
                      //                     : Colors.grey[
                      //                         400], // Set color based on checkbox status
                      //               ),
                      //             ),
                      //             Text(
                      //               'Rp ${widget.room.asuransi}',
                      //               style: TextStyle(
                      //                 fontFamily: 'Open Sans',
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 14,
                      //                 letterSpacing: 0.025,
                      //                 color: widget.room.isChecked
                      //                     ? Colors.black
                      //                     : Colors.grey[
                      //                         400], // Set color based on checkbox status
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const DividerTheme(
                        data: DividerThemeData(
                          color: Colors.black, // Set the color to black
                          thickness:
                              1.0, // Increase or decrease the thickness as desired
                        ),
                        child: Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 48.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                letterSpacing: 0.025,
                              ),
                            ),
                            Text(
                              formatter.format(
                                  hotelRoomProv.detailHotelRoom.normalPrice),
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                letterSpacing: 0.025,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.5.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Opsi Tambahan',
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                letterSpacing: 0.04,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(14.sp, 8.sp, 16.sp, 8.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child:
                                      Image.asset('assets/images/vector.jpeg'),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 44,
                                  width: 165,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.sp, vertical: 2.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Kupon',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your onPressed logic here
                                  },
                                  child: const Text('Tambahkan'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            const DividerTheme(
                              data: DividerThemeData(
                                color: Colors.black, // Set the color to black
                                thickness:
                                    1.0, // Increase or decrease the thickness as desired
                              ),
                              child: Divider(),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Kamu berhasil menggunakan kupon!',
                                  style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                      letterSpacing: 0.15,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.5.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 48.sp),
                        child: Row(
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
                      ),
                      DividerTheme(
                        data: DividerThemeData(
                          color: Colors.black,
                          thickness: 1.0.sp,
                        ),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 48.sp),
                        child: Row(
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
                              formatter.format(
                                  hotelRoomProv.detailHotelRoom.normalPrice),
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                letterSpacing: 0.025,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28.5.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0.sp, 8.sp, 0.sp, 8.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Consumer<PaymentHotelProvider>(
                          builder: (context, paymentProv, child) {
                            return Column(
                              children: paymentProv.payment.map((method) {
                                return ExpansionTile(
                                  title: Row(
                                    children: [
                                      Radio(
                                        value: method.type,
                                        groupValue: paymentMethod,
                                        onChanged: (value) {
                                          setState(() {
                                            paymentMethod = value;
                                          });
                                        },
                                      ),
                                      Text(method.type.toString()),
                                      Expanded(child: Container()),
                                      Image.network(
                                        method.imageUrl.toString(),
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                  trailing: const SizedBox.shrink(),
                                  children: [
                                    if (method.type == 'Kartu Kredit')
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            54.sp, 2.sp, 42.sp, 2.sp),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Masukkan No. Kartu',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0.sp,
                                                    horizontal: 15.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0.w,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0.r),
                                              ),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  DateInputFormatter(),
                                                ],
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Tanggal Kadaluarsa (DD/MM/YYYY)',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0.sp,
                                                    horizontal: 15.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0.w,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0.r),
                                              ),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  CvcCvvInputFormatter(),
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: 'Kode CVV/CVC',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0.sp,
                                                    horizontal: 15.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    if (method.type == 'Virtual Account')
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            54.sp, 2.sp, 42.sp, 2.sp),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: paymentProv
                                              .virtualAccountPayments.length,
                                          itemBuilder: (context, index) {
                                            final option = paymentProv
                                                .virtualAccountPayments[index];
                                            return GestureDetector(
                                              onTap: () {
                                                paymentProv.setPaymentId(
                                                    option.id as int);
                                                paymentProv.setPaymentType(
                                                    option.type.toString());
                                                debugPrint(
                                                    'paymentProv.paymentId: ${paymentProv.paymentId}');
                                                debugPrint(
                                                    'paymentProv.paymentType: ${paymentProv.paymentType}');
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(12.sp),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: paymentProv
                                                                .paymentId ==
                                                            option.id
                                                        ? Colors
                                                            .blue // Apply a different color for the selected option
                                                        : Colors.grey,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      option.imageUrl
                                                          .toString(),
                                                      width: 25.w,
                                                      height: 25.h,
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text(
                                                        option.name.toString()),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    if (method.type == 'Minimarket')
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            54.sp, 2.sp, 42.sp, 2.sp),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: paymentProv
                                              .miniMarketPayments.length,
                                          itemBuilder: (context, index) {
                                            final option = paymentProv
                                                .miniMarketPayments[index];
                                            return GestureDetector(
                                              onTap: () {
                                                paymentProv.setPaymentId(
                                                    option.id as int);
                                                paymentProv.setPaymentType(
                                                    option.type.toString());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(12.sp),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        selectedMinimarketOption ==
                                                                option
                                                            ? Colors.blue
                                                            : Colors.grey,
                                                    width: 3.0.w,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      option.imageUrl
                                                          .toString(),
                                                      width: 25.w,
                                                      height: 25.h,
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text(
                                                        option.name.toString()),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      // if (paymentMethods
                      //     .any((method) => method.title == paymentMethod))
                      ExpansionTile(
                        title: Text(
                          'Cara Pembayaran',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            letterSpacing: 0.025,
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
                            child: Column(
                              children: [
                                // Container(
                                //   padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                //   child: Column(
                                //     children: [
                                //       for (PaymentMethod method
                                //           in paymentMethods)
                                //         if (method.title == paymentMethod)
                                //           ...method.howTo.map(
                                //             (step) => Row(
                                //               children: [
                                //                 Text(step),
                                //               ],
                                //             ),
                                //           ),
                                //       SizedBox(
                                //         height: 6,
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
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
            height: 56.0,
            child: ElevatedButton(
              onPressed:
                  paymentMethod != null ? navigateToPaymentResultPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    paymentMethod != null ? Colors.blue : Colors.grey,
              ),
              child: Text(
                'Lanjut',
                style: TextStyle(fontSize: 18.0.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String calculateSubtotal(Room room) {
  final roomPrice = int.parse(room.price.replaceAll(RegExp(r'[^0-9]'), ''));
  final asuransiPrice =
      int.parse(room.asuransi.replaceAll(RegExp(r'[^0-9]'), ''));

  final subtotal = roomPrice + asuransiPrice;

  return 'Rp ${subtotal.toString()}';
}
