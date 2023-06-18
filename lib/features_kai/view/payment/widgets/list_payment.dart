import 'package:capstone_project_tripease/features_kai/view/payment/widgets/payment_page.dart';
import 'package:capstone_project_tripease/features_kai/view_model/carriage/order_train_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/carriage/payment_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../view_model/timer/time_payment_provider.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({Key? key}) : super(key: key);

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  int selectedContainer = 0;
  bool showContainer = false;
  double containerHeight = 240.0;
  int selectedRadio = 0;
  int selectedVA = 0;

  @override
  void initState() {
    super.initState();
    final paymentProv = Provider.of<PaymentProvider>(context, listen: false);
    paymentProv.getPayment();
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            timerText: TimerPaymentProvider(),
            imageUrl: getSelectedImage(),
            isPaymentVA: false,
          ),
        ),
      );
    } else if (selectedRadio == 2) {
      if (selectedVA == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              timerText: TimerPaymentProvider(),
              imageUrl: getSelectedImage(),
              isPaymentVA: true,
            ),
          ),
        );
      } else if (selectedVA == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              timerText: TimerPaymentProvider(),
              imageUrl: getSelectedImage(),
              isPaymentVA: true,
            ),
          ),
        );
      } else if (selectedVA == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              timerText: TimerPaymentProvider(),
              imageUrl: getSelectedImage(),
              isPaymentVA: true,
            ),
          ),
        );
      }
    } else {}
  }

  String getSelectedImage() {
    if (selectedRadio == 1) {
      return 'assets/images/credit_card.png';
    } else if (selectedRadio == 2 && selectedVA == 1) {
      return 'assets/images/bca.png';
    } else if (selectedRadio == 2 && selectedVA == 2) {
      return 'assets/images/bri.png';
    } else if (selectedRadio == 2 && selectedVA == 3) {
      return 'assets/images/mandiri.png';
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

    return Column(
      children: [
        Center(
          child: Container(
            height: 400.h,
            margin: EdgeInsets.only(top: 28.5.h),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
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
                        // Image.asset('assets/images/credit_card.png'),
                      ],
                    ),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 1;
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
                          // Image.asset('assets/images/bank-account.png'),
                        ],
                      ),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value as int;
                          showContainer = true;
                          containerHeight = showContainer ? 378.0.h : 240.0.h;
                        });
                      }),
                ),
                if (selectedRadio == 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedContainer = 1;
                            selectedVA = 1;
                          });
                        },
                        child: Container(
                          height: 45.h,
                          margin: EdgeInsets.only(left: 66.w),
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: selectedContainer == 1
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          child: Consumer<PaymentProvider>(
                            builder: (context, paymentProv, child) {
                              var lengthVA = paymentProv.payment.length;
                              return ListView.builder(
                                itemCount: lengthVA,
                                itemBuilder: (context, index) {
                                  var accNumber =
                                      paymentProv.payment[index].accountNumber;
                                  paymentProv.setAccountNumber(accNumber);
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        // Image.asset('assets/images/logo-ovo-pay.png')
                      ],
                    ),
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 3;
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
                        // Image.asset('assets/images/gopay.png'),
                      ],
                    ),
                    value: 4,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 4;
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
                        // Image.asset('assets/images/storefront.png'),
                      ],
                    ),
                    value: 5,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 5;
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
                        // Image.asset('assets/images/ticket_office.png'),
                      ],
                    ),
                    value: 6,
                    groupValue: selectedRadio,
                    onChanged: (sendRadioButton) {
                      setState(() {
                        selectedRadio = 6;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Center(
          child: ElevatedButton(
            onPressed: () {
              navigateToPage();
              var totalPrice = trainProv.getPrice;
              postOrderProv.setTotalPrice(totalPrice);
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(252, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                backgroundColor:
                    btnIsActive() ? Colors.grey : const Color(0XFF0080FF)),
            child: Text(
              'Lanjut',
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
