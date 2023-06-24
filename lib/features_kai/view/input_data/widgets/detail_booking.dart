import '/features_kai/view_model/order_ticket/order_train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodyDetailBooking extends StatefulWidget {
  const BodyDetailBooking({
    super.key,
  });

  @override
  State<BodyDetailBooking> createState() => _BodyDetailBookingState();
}

class _BodyDetailBookingState extends State<BodyDetailBooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController;
    _emailController;
    _phoneNumberController;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostOrderTrainProvider>(
      builder: (context, postOrderProv, child) {
        return Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                      controller: _nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(210, 215, 224, 1)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: 'Nama Lengkap',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) {
                        postOrderProv.setName(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Lengkap harap di isi.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text(
                    'Nomor Telepon',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                      controller: _phoneNumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(210, 215, 224, 1)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: 'Nomor Telepon',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) {
                        postOrderProv.setPhoneNumber(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Telepon harap di isi.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(210, 215, 224, 1)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: 'Email Pemesan',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) {
                        postOrderProv.setEmail(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email harap di isi.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 150.h,
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20.w),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 219, 215, 215),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.info_rounded, color: Colors.blue),
                            SizedBox(width: 8.w),
                            Text(
                              "Info",
                              style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12.h),
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Text(
                              'Data Pemesan hanya digunakan untuk mengirim invoice melalui email dan segala yang berhubungan dengan transaksi. Privasi data tetap terjaga',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines:
                                  6, // Jumlah maksimum baris yang ingin ditampilkan
                              overflow: TextOverflow
                                  .ellipsis, // Tindakan yang diambil saat teks melampaui jumlah maksimum baris
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(postOrderProv.getEmail);
                          print(postOrderProv.getName);
                          print(postOrderProv.getPhoneNumber);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: const Color(0XFF0080FF)),
                      child: Text(
                        'Tambahkan sebagai Penumpang',
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
      },
    );
  }
}
