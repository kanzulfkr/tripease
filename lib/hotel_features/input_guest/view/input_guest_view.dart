import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../detail_hotel/viewmodel/detail_hotel_provider.dart';
import '../../detail_kamar/viewmodel/hotel_room_detail_provider.dart';
import '../../hotel_home/viewmodel/search_hotel_provider.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_hotel/model/order_model.dart';
import '../../payment_hotel/view/payment_hotel.dart';
import '../../payment_hotel/viewmodel/payment_hotel_viewmodel.dart';
import '../viewmodel/input_guest_provider.dart';

class InputGuestPage extends StatefulWidget {
  const InputGuestPage({super.key});

  @override
  InputGuestPageState createState() => InputGuestPageState();
}

class InputGuestPageState extends State<InputGuestPage> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String selectedOption = 'Tuan';
  final TextEditingController _textEditingController = TextEditingController();
  int _wordCount = 0;
  int _maxWordCount = 400;
  bool _isConfirmed = false;

  List<String> imagesRoom = [
    'assets/images/detail_k1.jpeg',
    'assets/images/detail_k2.jpeg',
    'assets/images/detail_k3.jpeg'
  ];
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = _textEditingController.text.split(' ').length;
    });
  }

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pesanan'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Apakah data yang dimasukkan sudah benar?'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Tidak'),
            ),
            ElevatedButton(
              onPressed: () {
                final paymentProv =
                    Provider.of<PaymentHotelProvider>(context, listen: false);
                paymentProv.getPaymentData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPageHotel(),
                  ),
                );
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final detailHotel = Provider.of<DetailHotelProvider>(context);
    final detailHotelRoom = Provider.of<DetailHotelRoomProvider>(context);
    bool isFacilityAvailable(String facilityName) {
      return detailHotelRoom.detailHotelRoom.hotelRoomFacility!
          .any((facility) => facility.name == facilityName);
    }

    final searchProv = Provider.of<SearchProvider>(context);
    final List<GlobalObjectKey<FormState>> formKeyList = List.generate(
        searchProv.jumlahDewasa as int,
        (index) => GlobalObjectKey<FormState>(index));

    bool isWifiAvailable = isFacilityAvailable("Wifi");

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              detailHotel.detailHotel.name.toString(),
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  letterSpacing: 0.025.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'Kamar ${detailHotelRoom.detailHotelRoom.name.toString()}',
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  letterSpacing: 0.04.sp),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 11.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(
                              0xFF0080FF), // Use the hex color code #0080FF
                          width: 1.0.w,
                        ),
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0.sp),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detailHotelRoom.detailHotelRoom.name
                                      .toString(),
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                    letterSpacing: 0.04.sp,
                                  ),
                                ),
                                Text(
                                  '${formatter.format(detailHotelRoom.detailHotelRoom.normalPrice)}/Malam',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    letterSpacing: 0.04.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: detailHotelRoom
                                    .detailHotelRoom.hotelRoomImage!
                                    .map(
                                      (image) => Padding(
                                        padding: EdgeInsets.only(right: 10.sp),
                                        child: Container(
                                          width: 110,
                                          height: 59,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              width: 0.1,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: image.imageUrl != "string" &&
                                                  image.imageUrl != null &&
                                                  image.imageUrl != "h.png" &&
                                                  image.imageUrl != "c.jpg"
                                              ? Image.network(
                                                  image.imageUrl.toString())
                                              : Image.asset(imagesRoom[0]),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
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
                                      "${detailHotelRoom.detailHotelRoom.numberOfGuest} Tamu",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        letterSpacing: 0.04.sp,
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
                                      '${detailHotelRoom.detailHotelRoom.numberOfMattress} ${detailHotelRoom.detailHotelRoom.mattressSize}',
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
                                    Container(
                                      child: detailHotel.detailHotel.hotelPolicy
                                                  ?.isBreakfast !=
                                              false
                                          ? Row(
                                              children: [
                                                const Icon(Icons.restaurant),
                                                SizedBox(
                                                  width: 14.w,
                                                ),
                                                Text(
                                                  "Breakfast",
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
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
                                                  "No Breakfast",
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 0.04,
                                                  ),
                                                )
                                              ],
                                            ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.credit_card),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          detailHotel.detailHotel.hotelPolicy
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
                                    isWifiAvailable == true
                                        ? Row(
                                            children: [
                                              const Icon(Icons.wifi),
                                              SizedBox(
                                                width: 14.w,
                                              ),
                                              Text(
                                                "Wifi",
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.04,
                                                ),
                                              )
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              const Icon(Icons.wifi_off),
                                              SizedBox(
                                                width: 14.w,
                                              ),
                                              Text(
                                                "No Wifi",
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.04,
                                                ),
                                              )
                                            ],
                                          ),
                                    // Container(
                                    //   child: Row(
                                    //     children: [
                                    //       Icon(Icons.event_available),
                                    //       SizedBox(width: 14,),
                                    //       Text(widget.room.reSchedule,
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
                                    detailHotel.detailHotel.hotelPolicy
                                                ?.isSmoking ==
                                            true
                                        ? Text(
                                            "Smoking Area",
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              letterSpacing: 0.04,
                                            ),
                                          )
                                        : Text(
                                            "No Smoking Area",
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
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 25.h,
                  ),
                  Consumer<InputGuestProvider>(
                    builder: (context, inputGuestProv, child) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F8),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.1.w,
                          ),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            'Detail Pemesan',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              letterSpacing: 0.025,
                            ),
                          ),
                          children: <Widget>[
                            Form(
                              key: _formKey1,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text('Nama'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12.h,
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
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                keyboardType:
                                                    TextInputType.name,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Nama tidak boleh kosong';
                                                  } else if (value.length < 3) {
                                                    return 'Nama minimal 3 karakter';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  inputGuestProv
                                                      .setOrderName(value);
                                                },
                                                decoration: InputDecoration(
                                                  hintText: 'Nama Pemesan',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0.sp,
                                                    horizontal: 15.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text('Nomor Telepon'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12.h,
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
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                keyboardType:
                                                    TextInputType.phone,
                                                onChanged: (value) {
                                                  inputGuestProv
                                                      .setOrderPhone(value);
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Nomor telepon tidak boleh kosong';
                                                  } else if (value.length <
                                                      10) {
                                                    return 'Nomor telepon minimal 10 karakter';
                                                  } else if (value.substring(
                                                          0, 1) !=
                                                      '0') {
                                                    return 'Nomor telepon harus diawali dengan 0';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Nomor telepon (diawali 0)',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0.sp,
                                                    horizontal: 15.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text('Email'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12.h,
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
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (email) {
                                                  if (email == null ||
                                                      email.isEmpty) {
                                                    return 'Email tidak boleh kosong';
                                                  } else if (!EmailValidator
                                                      .validate(email)) {
                                                    return 'Format Email tidak valid';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  inputGuestProv
                                                      .setOrderEmail(value);
                                                },
                                                decoration: InputDecoration(
                                                  hintText: 'Email Pemesan',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0.sp,
                                                    horizontal: 15.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16.sp),
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .grey, // Grey color inside the container
                                            borderRadius: BorderRadius.circular(
                                                10.r), // Curved outline border
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.info),
                                                  SizedBox(width: 20.w),
                                                  Text(
                                                    'Info',
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp,
                                                      letterSpacing: 0.025.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20.h),
                                              Column(
                                                children: [
                                                  Text(
                                                    'Data pemesan hanya digunakan untuk mengirim invoice melalui email dan segala hal yang berhubungan dengan transaksi. Privasi data tetap terjaga.',
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14.sp,
                                                      letterSpacing: 0.04,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add your button's onPressed logic here
                                          },
                                          child: const Text(
                                              'Tambahkan sebagai Tamu'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F8),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.1,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Detail Pelanggan',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: 0.025,
                        ),
                      ),
                      children: <Widget>[
                        Consumer<InputGuestProvider>(
                          builder: (context, inputGuestProv, child) {
                            final searchProv = Provider.of<SearchProvider>(
                                context,
                                listen: false);
                            if (inputGuestProv.travelerDetail == null ||
                                inputGuestProv.travelerDetail!.length !=
                                    searchProv.jumlahDewasa) {
                              inputGuestProv.travelerDetail = List.generate(
                                  searchProv.jumlahDewasa as int,
                                  (index) => TravelerDetail());
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchProv.jumlahDewasa,
                              itemBuilder: (context, index) {
                                final cust = index + 1;
                                final guest =
                                    inputGuestProv.travelerDetail!.length >
                                            index
                                        ? inputGuestProv.travelerDetail![index]
                                        : TravelerDetail();
                                return Form(
                                  key: formKeyList[index],
                                  child: Column(
                                    children: [
                                      SizedBox(height: 12.h),
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                              child: Column(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text('Pelanggan $cust'),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            16.sp,
                                                            10.5.sp,
                                                            16.sp,
                                                            10.5.sp),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      border: Border.all(
                                                        width: 1.w,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: DropdownButton<
                                                              String>(
                                                            isExpanded: true,
                                                            value: guest.title,
                                                            onChanged: (String?
                                                                newValue) {
                                                              guest.title =
                                                                  newValue;
                                                              inputGuestProv
                                                                  .updateTravelerTitle(
                                                                      index,
                                                                      newValue);
                                                              debugPrint(
                                                                  'title: ${guest.title}');
                                                            },
                                                            items: <String>[
                                                              'Tuan',
                                                              'Nyonya'
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Column(
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Text(
                                                              'Nomor Identitas'),
                                                        ],
                                                      ),
                                                      SizedBox(height: 12.h),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1.0.w,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0.r),
                                                        ),
                                                        child: TextFormField(
                                                          autovalidateMode: // Add this line
                                                              AutovalidateMode
                                                                  .always,
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'Tolong Masukkan Nomor Identitas';
                                                            } else if (value
                                                                    .length <
                                                                16) {
                                                              return 'Nomor Identitas Tidak Valid';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            guest.idCardNumber =
                                                                value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'NIK / Paspor',
                                                            border: InputBorder
                                                                .none,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                              vertical: 10.0.sp,
                                                              horizontal:
                                                                  15.0.sp,
                                                            ),
                                                          ),
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly // Allows only numeric input
                                                          ],
                                                          keyboardType:
                                                              TextInputType
                                                                  .number, // Shows numeric keyboard
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Column(
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Text('Nama Lengkap'),
                                                        ],
                                                      ),
                                                      SizedBox(height: 12.h),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1.0.w,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0.r),
                                                        ),
                                                        child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .always,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          validator: (value) {
                                                            if (value == null &&
                                                                value!
                                                                    .isEmpty) {
                                                              return 'Nama Lengkap tidak boleh kosong';
                                                            } else if (value
                                                                    .length <
                                                                3) {
                                                              return 'Nama Lengkap minimal 3 karakter';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            guest.fullName =
                                                                value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Nama Lengkap',
                                                            border: InputBorder
                                                                .none,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                              vertical: 10.0.sp,
                                                              horizontal:
                                                                  15.0.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Permintaan Khusus',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: 0.025,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    height: 208.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF0080FF),
                        width: 1.0.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            onChanged: (value) {
                              _updateWordCount();
                              final inputProv = Provider.of<InputGuestProvider>(
                                  context,
                                  listen: false);

                              inputProv.setRequest(value);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Silahkan deskripsikan dengan jelas',
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text('Batas kata: ($_wordCount/$_maxWordCount)'),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey1.currentState != null &&
                                _formKey1.currentState!.validate()) {
                              for (var formKeyLists in formKeyList) {
                                if (formKeyLists.currentState != null &&
                                    formKeyLists.currentState!.validate()) {
                                  _showConfirmationDialog();
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: const Text('Konfirmasi'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
