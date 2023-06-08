import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_result/view/payment_result.dart';
import '../model/payment_page_model.dart';
import '../viewmodel/payment_hotel_viewmodel.dart';

class AnotherPage extends StatefulWidget {
  final Room room;
  final ListHotel list;

  const AnotherPage({required this.room, required this.list});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  String? paymentMethod;
  List<PaymentMethod> paymentMethods = [
    PaymentMethod('Kartu Kredit', 'assets/images/CC.jpeg', ['A', 'B'], ),
    PaymentMethod('Virtual Account', 'assets/images/VA.jpeg', ['C', 'D'],),
    PaymentMethod('OVO', 'assets/images/OVO.jpeg', ['E', 'F']),
    PaymentMethod('Gopay', 'assets/images/Gopay.jpeg', ['G', 'H']),
    PaymentMethod('Minimarket', 'assets/images/Minimarket.jpeg', ['I', 'J']),
    PaymentMethod('Bayar di Hotel', 'assets/images/Hotel.jpeg', ['K', 'L']),
  ];
  VirtualAccountOption? selectedVirtualAccountOption;
  MinimarketOption? selectedMinimarketOption;
  late Timer _timer;
  int _secondsRemaining = 300;

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          showPopup();
        }
      });
    });
  }

  void navigateToPaymentResultPage() {
    PaymentMethod selectedPaymentMethod = paymentMethods.firstWhere(
      (method) => method.title == paymentMethod,
      orElse: () => PaymentMethod('', '', []),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentResultPage(
          paymentMethod: selectedPaymentMethod,
          room: widget.room,
          list: widget.list,
        ),
      ),
    );
  }



  void showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Waktu Pembayaran Habis'),
          content: Text('Silakan kembali ke halaman sebelumnya.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the previous page
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Waktu Pembayaran',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 0.04,
                          ),
                        ),
                        Text(
                          formatTime(_secondsRemaining),
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9,),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hotel',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                widget.room.price,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 17,),
                        Container(
                          child: Row(
                            children: [
                              Checkbox(
                                value: widget.room.isChecked, // Gunakan nilai isChecked sebagai nilai checkbox
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.room.isChecked = value ?? false; // Update nilai isChecked saat checkbox berubah
                                  });
                                },
                              ),
                              Container(
                                width: 322,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Asuransi',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        letterSpacing: 0.025,
                                      ),
                                    ),
                                    Text(
                                      widget.room.asuransi,
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        letterSpacing: 0.025,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        DividerTheme(
                          data: DividerThemeData(
                            color: Colors.black,      // Set the color to black
                            thickness: 1.0,           // Increase or decrease the thickness as desired
                          ),
                          child: Divider(),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                widget.room.isChecked ? calculateSubtotal(widget.room) : widget.room.subtotal,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.5,),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Opsi Tambahan',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: 0.04,
                                  color: Colors.grey
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.fromLTRB(14, 8, 16, 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset('assets/images/vector.jpeg'),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 44,
                                      width: 169,
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Kupon',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Add your onPressed logic here
                                      },
                                      child: Text('Tambahkan'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4,),
                              DividerTheme(
                                data: DividerThemeData(
                                  color: Colors.black,      // Set the color to black
                                  thickness: 1.0,           // Increase or decrease the thickness as desired
                                ),
                                child: Divider(),
                              ),
                              SizedBox(height: 4,),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Kamu berhasil menggunakan kupon!',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        letterSpacing: 0.15,
                                        color: Colors.green
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.5,),
                        Container(
                          padding: EdgeInsets.only(left: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kupon',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                '- Rp 50.000',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                  color: Colors.orange
                                ),
                              ),
                            ],
                          ),
                        ),
                        DividerTheme(
                          data: DividerThemeData(
                            color: Colors.black,      // Set the color to black
                            thickness: 1.0,           // Increase or decrease the thickness as desired
                          ),
                          child: Divider(),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                widget.room.total,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 28.5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: paymentMethods.map((method) {
                              return ExpansionTile(
                                title: Row(
                                  children: [
                                    Radio(
                                      value: method.title,
                                      groupValue: paymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          paymentMethod = value;
                                        });
                                      },
                                    ),
                                    Text(method.title),
                                    Expanded(child: Container()),
                                    Image.asset(method.imageAsset,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ],
                                ),
                                trailing: SizedBox.shrink(),
                                children: [
                                  if (method.title == 'Kartu Kredit')
                                  Container(
                                    padding: EdgeInsets.fromLTRB(54, 2, 42, 2),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: 'Masukkan No. Kartu',
                                              border: InputBorder.none,
                                              contentPadding: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 15.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              DateInputFormatter(),
                                            ],
                                            decoration: InputDecoration(
                                              hintText: 'Tanggal Kadaluarsa (DD/MM/YYYY)',
                                              border: InputBorder.none,
                                              contentPadding: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 15.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CvcCvvInputFormatter(),
                                            ],
                                            decoration: InputDecoration(
                                              hintText: 'Kode CVV/CVC',
                                              border: InputBorder.none,
                                              contentPadding: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 15.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12,)
                                      ],
                                    ),
                                  ),
                                  if (method.title == 'Virtual Account')
                                  Container(
                                    padding: EdgeInsets.fromLTRB(54, 2, 42, 2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: virtualAccountOptions.length,
                                      itemBuilder: (context, index) {
                                        final option = virtualAccountOptions[index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedVirtualAccountOption = option;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: selectedVirtualAccountOption == option
                                                    ? Colors.blue // Apply a different color for the selected option
                                                    : Colors.grey,
                                                width: 3.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  option.imageAsset,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                                SizedBox(width: 8,),
                                                Text(option.title),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (method.title == 'Minimarket')
                                  Container(
                                    padding: EdgeInsets.fromLTRB(54, 2, 42, 2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: minimarketOptions.length,
                                      itemBuilder: (context, index) {
                                        final option = minimarketOptions[index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedMinimarketOption = option;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: selectedMinimarketOption == option
                                                    ? Colors.blue // Apply a different color for the selected option
                                                    : Colors.grey,
                                                width: 3.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  option.imageAsset,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                                SizedBox(width: 8,),
                                                Text(option.title),
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
                          ),
                        ),
                        SizedBox(height: 12,),
                        if (paymentMethods.any((method) => method.title == paymentMethod))
                        ExpansionTile(
                          title: Text(
                            'Cara Pembayaran',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              letterSpacing: 0.025,
                            ),
                          ),
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                             Text('kosong')
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 6,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
          child: Container(
            height: 56.0,
            child: ElevatedButton(
              onPressed: () {
                navigateToPaymentResultPage();
              },
              child: Text(
                'Lanjut',
                style: TextStyle(fontSize: 18.0),
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
  final asuransiPrice = int.parse(room.asuransi.replaceAll(RegExp(r'[^0-9]'), ''));

  final subtotal = roomPrice + asuransiPrice;

  return 'Rp ${subtotal.toString()}';
}