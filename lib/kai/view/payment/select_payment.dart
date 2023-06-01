import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  int selectedContainer = 0;
  bool showContainer = false;
  double containerHeight = 240.0;
  int selectedRadio = 0;

  void sendRadioButton(int value) {
    setState(() {
      (selectedRadio = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: containerHeight,
        width: 340,
        margin: EdgeInsets.only(top: 28.5),
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
                          fontSize: 14, fontWeight: FontWeight.w600),
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
                            fontSize: 14, fontWeight: FontWeight.w600),
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
                      containerHeight = showContainer ? 378.0 : 240.0;
                    });
                  }),
            ),
            if (selectedRadio == 2)
              Padding(
                padding: const EdgeInsets.only(left: 66, top: 10),
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
                        width: 254,
                        height: 42,
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
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'BCA Virtual Account',
                                style: GoogleFonts.openSans(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 2;
                        });
                      },
                      child: Container(
                        width: 254,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedContainer == 2
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Image.asset('assets/images/bri.png'),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'BRI Virtual Account',
                                style: GoogleFonts.openSans(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 3;
                        });
                      },
                      child: Container(
                        width: 254,
                        height: 42,
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
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Mandiri Virtual Account',
                                style: GoogleFonts.openSans(
                                    fontSize: 12, fontWeight: FontWeight.w600),
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
                          fontSize: 14, fontWeight: FontWeight.w600),
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
                          fontSize: 14, fontWeight: FontWeight.w600),
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
                          fontSize: 14, fontWeight: FontWeight.w600),
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
                          fontSize: 14, fontWeight: FontWeight.w600),
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
    );
  }
}