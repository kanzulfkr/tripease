import 'package:capstone_project_tripease/kai/view/input_data/appbar_input_data.dart';
import 'package:capstone_project_tripease/kai/view/input_data/detail_booking.dart';
import 'package:capstone_project_tripease/kai/view/input_data/detail_pessanger.dart';
import 'package:capstone_project_tripease/kai/view/payment/payment_page.dart';
import 'package:capstone_project_tripease/kai/view_model/carriage_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/departure_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputDataKai extends StatefulWidget {
  const InputDataKai({super.key});

  @override
  State<InputDataKai> createState() => _InputDataKaiState();
}

class _InputDataKaiState extends State<InputDataKai> {
  bool isDropdownPemesan = false;
  bool isDropdownPenumpang = false;
  bool val = false;
  List<String> list = <String>['Tuan', 'Nyonya'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final departureProvider =
        Provider.of<DepartureViewModel>(context, listen: false);

    Future.microtask(() => Provider.of<CarriageProvider>(context, listen: false)
        .fetchCarriage(
            trainId: departureProvider
                .departure[departureProvider.selectedDepartIndex as int]
                .trainId,
            trainClass: departureProvider
                .departure[departureProvider.selectedDepartIndex as int]
                .datumClass,
            limit: 9999));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Row(
          children: [
            AppbarInputData(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: double.maxFinite,
                child: Consumer<DepartureViewModel>(
                  builder: (context, departureProvider, child) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 12),
                          child: Container(
                            height: 160,
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.2,
                                  blurRadius: 0.5,
                                  offset: const Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/logo_kai.svg',
                                      width: 24,
                                      height: 21,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProvider
                                          .departure[departureProvider
                                              .selectedDepartIndex as int]
                                          .route[0]
                                          .station
                                          .origin,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Stasiun ${departureProvider.departure[departureProvider.selectedDepartIndex as int].route[0].station.name}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Rp ${departureProvider.departure[departureProvider.selectedDepartIndex as int].price},-',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProvider
                                          .departure[departureProvider
                                              .selectedDepartIndex as int]
                                          .datumClass,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(113, 114, 117, 1),
                                      ),
                                    ),
                                    departureProvider
                                                .departure[departureProvider
                                                    .selectedDepartIndex as int]
                                                .status ==
                                            'available'
                                        ? Text(
                                            'Tersedia',
                                            style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green,
                                            ),
                                          )
                                        : Text(
                                            'Habis',
                                            style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProvider
                                          .departure[departureProvider
                                              .selectedDepartIndex as int]
                                          .route[0]
                                          .arriveTime,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward),
                                    Text(
                                      departureProvider
                                          .departure[departureProvider
                                              .selectedDepartIndex as int]
                                          .route[1]
                                          .arriveTime,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProvider.departureDate == ''
                                          ? DateFormat('EEEE, dd MMMM', 'id_ID')
                                              .format(DateTime.now())
                                          : departureProvider.departureDate,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(113, 114, 117, 1),
                                      ),
                                    ),
                                    Text(
                                      '0 j 30 m',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(113, 114, 117, 1),
                                      ),
                                    ),
                                    Text(
                                      departureProvider.departureDate == ''
                                          ? DateFormat('EEEE, dd MMMM', 'id_ID')
                                              .format(DateTime.now())
                                          : departureProvider.departureDate,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(113, 114, 117, 1),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownPemesan = !isDropdownPemesan;
                  });
                },
                child: Container(
                  height: 48,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xF9FAFBFB),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.5,
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detail Pemesanan ',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        isDropdownPemesan
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDropdownPemesan) ...[
                const BodyDetailBooking(),
              ],
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownPenumpang = !isDropdownPenumpang;
                  });
                },
                child: Container(
                  height: 48,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xF9FAFBFB),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.5,
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detail Penumpang ',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        isDropdownPenumpang
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDropdownPenumpang) ...[
                BodyDetailPessanger(list: list),
              ],
              const SizedBox(
                height: 99,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showCustomAlertDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(252, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      primary:
                          const Color(0XFF0080FF) // Warna latar belakang biru
                      ),
                  child: Text(
                    'Konfirmasi',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Container(
            height: 101,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Konfirmasi Pesanan',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Tambahkan konten dialog di sini
                Text(
                  'Apakah data yang dimasukkan sudah benar?',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tidak',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Ya',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
