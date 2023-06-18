import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../payment/select_payment.dart';
import 'widgets/appbar_input_data.dart';
import 'widgets/detail_booking.dart';
import 'widgets/detail_pessanger.dart';
import 'widgets/show_dialog.dart';

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
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<TrainProvider>(
                builder: (context, trainProvider, child) {
                  return SizedBox(
                    height: 180.h,
                    width: double.maxFinite,
                    child: Container(
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/kai.png',
                                scale: 0.8,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${trainProvider.getNameTrain}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Rp. ${trainProvider.getPrice},-',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Stasiun ${trainProvider.getStationOrigin}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Stasiun ${trainProvider.getStationDepature}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${trainProvider.getClassTrain}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(113, 114, 117, 1),
                                ),
                              ),
                              Text(
                                'Tersedia',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(61, 175, 29, 1),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${trainProvider.getArriveTime}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Icon(Icons.arrow_forward),
                              Text(
                                '${trainProvider.getDepatureTime}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '05 April 2023',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(113, 114, 117, 1),
                                ),
                              ),
                              Text(
                                '${trainProvider.getdateTime}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(113, 114, 117, 1),
                                ),
                              ),
                              Text(
                                '05 April 2023',
                                style: TextStyle(
                                  fontSize: 12.sp,
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
              SizedBox(height: 30.h),
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
                      fontSize: 14.sp,
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
}
