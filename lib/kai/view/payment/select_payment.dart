import 'package:capstone_project_tripease/kai/view/payment/other_payment.dart';
import 'package:capstone_project_tripease/kai/view/payment/payment_va.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

GlobalKey<_SelectPaymentState> selectPaymentKey =
    GlobalKey<_SelectPaymentState>();

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
  // bool btnIsActive = true;

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
      // setState(() {
      //   btnIsActive == true;
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtherPayment(
                  timerText: TimerPaymentProvider(),
                )),
      );
    } else if (selectedRadio == 2) {
      // setState(() {
      //   btnIsActive == true;
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PaymentVA(
                  timerText: TimerPaymentProvider(),
                )),
      );
    } else if (selectedRadio == 0) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: containerHeight,
            width: 340.w,
            margin: EdgeInsets.only(top: 28.5.h),
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFF0F0F8),
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
                        const Icon(
                          Icons.credit_card,
                          color: Colors.black,
                        )
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
                          Image.asset('assets/images/bank-account.png'),
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
                  Padding(
                    padding: EdgeInsets.only(left: 66.w, top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainer = 1;
                            });
                          },
                          child: Container(
                            width: 254.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: selectedContainer == 1
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/bca.png'),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    'BCA Virtual Account',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainer = 2;
                            });
                          },
                          child: Container(
                            width: 254.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: selectedContainer == 2
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2.0.w,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/bri.png'),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    'BRI Virtual Account',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainer = 3;
                            });
                          },
                          child: Container(
                            width: 254.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: selectedContainer == 3
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/mandiri.png'),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    'Mandiri Virtual Account',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        Image.asset('assets/images/logo-ovo-pay.png')
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
                        Image.asset('assets/images/gopay.png'),
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
                        Image.asset('assets/images/storefront.png'),
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
                        Image.asset('assets/images/ticket_office.png'),
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
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              btnIsActive() ? null : navigateToPage();
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(252, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                primary: btnIsActive() ? Colors.grey : Color(0XFF0080FF)),
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
