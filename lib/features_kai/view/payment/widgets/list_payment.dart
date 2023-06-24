import 'package:capstone_project_tripease/features_kai/view/payment/payment_page.dart';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/order_train_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/payment_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../model/order_train_model.dart';
import '../../../view_model/order_ticket/response_order_train_provider.dart';
import '../../../view_model/station/departure_provider.dart';
import '../../../view_model/station/station_provider.dart';
import '../../../view_model/timer/time_payment_provider.dart';

class ListPayment extends StatefulWidget {
  const ListPayment({Key? key}) : super(key: key);

  @override
  State<ListPayment> createState() => _ListPaymentState();
}

class _ListPaymentState extends State<ListPayment> {
  int selectedContainer = 0;
  bool showContainer = false;
  int selectedRadio = 0;
  int selectedVA = 0;

  @override
  void initState() {
    super.initState();
    final paymentProv = Provider.of<PaymentProvider>(context, listen: false);
    paymentProv.getPayment();
    paymentProv.setDataPayment(0, '', '', '');
  }

  bool btnIsActive() {
    return selectedRadio == 0;
  }

  void sendRadioButton(int value) {
    setState(() {
      (selectedRadio = value);
    });
  }

  void navigateToPage() {
    if (selectedRadio == 1 ||
        selectedRadio == 3 ||
        selectedRadio == 4 ||
        selectedRadio == 5 ||
        selectedRadio == 6) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            timerText: TimerPaymentProvider(),
            imageUrl: getSelectedImage(),
            isPaymentVA: false,
          ),
        ),
        (route) => false,
      );
    } else if (selectedRadio == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            timerText: TimerPaymentProvider(),
            imageUrl: getSelectedImage(),
            isPaymentVA: true,
          ),
        ),
        (route) => false,
      );
    } else {}
  }

  String getSelectedImage() {
    if (selectedRadio == 1) {
      return 'assets/images/credit_card.png';
    } else if (selectedRadio == 2) {
      return '';
    } else if (selectedRadio == 3) {
      return 'assets/images/logo-ovo-pay.png';
    } else if (selectedRadio == 4) {
      return 'assets/images/gopay.png';
    } else if (selectedRadio == 5) {
      return 'assets/images/storefront.png';
    } else if (selectedRadio == 6) {
      return 'assets/images/ticket_office.png';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final postOrderProv =
        Provider.of<PostOrderTrainProvider>(context, listen: false);
    final trainProv = Provider.of<TrainProvider>(context, listen: false);
    final paymentProv = Provider.of<PaymentProvider>(context, listen: false);
    int lengthVA = paymentProv.payment.length;
    int heightVA = 40 * lengthVA;

    return Column(
      children: [
        Center(
          child: Container(
            height: showContainer ? (300 + heightVA).h : 300.h,
            margin: EdgeInsets.only(top: 28.h),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: const Color(0xFFF0F0F8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kartu Kredit/Debit",
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Image.asset('assets/images/credit_card.png'),
                      ],
                    ),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 1;
                        showContainer = false;
                        paymentProv.setDataPayment(0, '', '', '');
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Virtual Account",
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/bank-account.png'),
                        ],
                      ),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value as int;
                          showContainer = true;
                        });
                      }),
                ),
                if (selectedRadio == 2)
                  Container(
                    height: heightVA.h,
                    padding: EdgeInsets.only(top: 5.h),
                    child: ListView.builder(
                      itemCount: lengthVA,
                      itemBuilder: (context, index) {
                        var paymentId = paymentProv.payment[index].id;
                        var paymentName = paymentProv.payment[index].name;
                        var paymentNumber =
                            paymentProv.payment[index].accountNumber;
                        var paymentImageUrl =
                            paymentProv.payment[index].imageUrl;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainer = index + 1;
                              selectedVA = index + 1;
                              paymentProv.setDataPayment(paymentId, paymentName,
                                  paymentImageUrl, paymentNumber);
                              print('id : ${paymentProv.getPaymentId}');
                              print(
                                  'paymentName : ${paymentProv.getPaymentName}');
                              print(
                                  'accNumber : ${paymentProv.getAccountNumber}');
                              print('iamge : ${paymentProv.getImageUrl}');
                            });
                          },
                          child: Container(
                            height: 45.h,
                            width: 200.w,
                            margin: EdgeInsets.only(left: 66.w, top: 5.h),
                            padding: EdgeInsets.only(top: 5.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: selectedContainer == index + 1
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                  width: 50.w,
                                  child: Image.network(
                                    paymentProv.payment[index].imageUrl,
                                  ),
                                ),
                                Text(
                                  paymentProv.payment[index].name,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                //   },
                // ),
                Expanded(
                  child: RadioListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ovo",
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Image.asset('assets/images/logo-ovo-pay.png')
                      ],
                    ),
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 3;
                        showContainer = false;
                        paymentProv.setDataPayment(0, '', '', '');
                        paymentProv.setDataPayment(0, '', '', '');
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gopay",
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Image.asset('assets/images/gopay.png'),
                      ],
                    ),
                    value: 4,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 4;
                        showContainer = false;
                        paymentProv.setDataPayment(0, '', '', '');
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Minimarket",
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Image.asset('assets/images/storefront.png'),
                      ],
                    ),
                    value: 5,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 5;
                        showContainer = false;
                        paymentProv.setDataPayment(0, '', '', '');
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bayar di Loket",
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Image.asset('assets/images/ticket_office.png'),
                      ],
                    ),
                    value: 6,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 6;
                        showContainer = false;
                        paymentProv.setDataPayment(0, '', '', '');
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              if (paymentProv.getPaymentId == 0) {
                print('Metode Payment belum dipilih');
              } else if (paymentProv.getPaymentId != 0) {
                final orderTrain =
                    Provider.of<PostOrderTrainProvider>(context, listen: false);
                final stationProv =
                    Provider.of<StationProvider>(context, listen: false);

                if (stationProv.pulangPergi == false) {
                  PostOrderTrainModel postOrder = PostOrderTrainModel(
                    emailOrder: orderTrain.getEmail,
                    nameOrder: orderTrain.getName,
                    paymentId: paymentProv.getPaymentId,
                    phoneNumberOrder: orderTrain.getPhoneNumber,
                    quantityAdult: orderTrain.getQuantityAdult,
                    quantityInfant: orderTrain.getQuantityInfant,
                    ticketTravelerDetailDeparture:
                        orderTrain.getTicketTravelerDetail,
                    travelerDetail: orderTrain.travelerDetail,
                    withReturn: stationProv.pulangPergi,
                  );
                  await orderTrain.postOrderTrain(postOrder);
                } else if (stationProv.pulangPergi == true) {
                  PostOrderTrainModel postOrderWithReturn = PostOrderTrainModel(
                    emailOrder: orderTrain.getEmail,
                    nameOrder: orderTrain.getName,
                    paymentId: paymentProv.getPaymentId,
                    phoneNumberOrder: orderTrain.getPhoneNumber,
                    quantityAdult: orderTrain.getQuantityAdult,
                    quantityInfant: orderTrain.getQuantityInfant,
                    ticketTravelerDetailDeparture:
                        orderTrain.getTicketTravelerDetail,
                    ticketTravelerDetailReturn:
                        orderTrain.getTicketTravelerDetailReturn,
                    travelerDetail: orderTrain.travelerDetail,
                    withReturn: stationProv.pulangPergi,
                  );
                  // print('${orderTrain.getEmail}');
                  // print('${orderTrain.getName}');
                  // print('${orderTrain.getPaymentId.toString()}');
                  // print('${orderTrain.getPhoneNumber}');
                  // print('${orderTrain.getQuantityAdult}');
                  // print('${orderTrain.getQuantityInfant}');
                  // print('${orderTrain.getEmail}');
                  // print('departure');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetail?[0].stationOriginId}');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetail?[0].stationDestinationId}');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetail?[0].trainCarriageId}');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetail?[0].trainSeatId}');
                  // print('return');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetailReturn?[0].stationOriginId}');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetailReturn?[0].stationDestinationId}');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetailReturn?[0].trainCarriageId}');
                  // print(
                  //     '${orderTrain.getTicketTravelerDetailReturn?[0].trainSeatId}');
                  // print(orderTrain.travelerDetail?[0].fullName);
                  // print(orderTrain.travelerDetail?[0].idCardNumber);
                  // print(orderTrain.travelerDetail?[0].title);
                  // print(stationProv.pulangPergi);

                  await orderTrain.postOrderTrain(postOrderWithReturn);
                }

                if (mounted) {
                  var departureProv =
                      Provider.of<DepartureProvider>(context, listen: false);
                  var responseOrderProv =
                      Provider.of<ResponseOrderTrainProvider>(context,
                          listen: false);
                  var trainId = departureProv
                      .departure[departureProv.selectedDepartIndex as int]
                      .trainId;
                  var ticketId = orderTrain.getTicketOrderId;
                  await responseOrderProv.getResponseOrder(ticketId, trainId);
                }
                var totalPrice = trainProv.getPrice;
                postOrderProv.setTotalPrice(totalPrice);

                navigateToPage();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                        child: Text(
                          'Berhasil melakukan order Tiket KA',
                        ),
                      ),
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(252, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                backgroundColor: paymentProv.getPaymentId == 0
                    ? Colors.grey
                    : const Color(0XFF0080FF)),
            child: Text(
              'Order Ticket Now',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Warna teks putih
              ),
            ),
          ),
        ),
      ],
    );
  }
}
