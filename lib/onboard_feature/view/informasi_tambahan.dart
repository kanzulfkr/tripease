import 'dart:convert';
import 'dart:io';
import '/onboard_feature/view/login.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import '../model/register_model.dart';
import '../view_model/register_provider.dart';
import 'widget/date_picker.dart';

class InformasiTambahan extends StatefulWidget {
  const InformasiTambahan({super.key});

  @override
  State<InformasiTambahan> createState() => _InformasiTambahanState();
}

class _InformasiTambahanState extends State<InformasiTambahan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
        () => Provider.of<RegisterProvider>(context, listen: false));
  }

  String selectGender = 'Laki-Laki';
  List<String> genders = ['Laki-Laki', 'Perempuan'];
//   File? _image;
//   String? _stringImage;

//   Future<String> convertImageToString(File? imageFile) async {
//     List<int> imageBytes = await imageFile!.readAsBytes();
//     String base64Image = base64Encode(imageBytes);
//     _stringImage = base64Image;
//     return base64Image;
//   }

// // Usage
//   Future<void> _getImage() async {
//     final imagePicker = ImagePicker();
//     final pickedFile = await imagePicker.pickImage(
//       source: ImageSource.gallery,
//     );
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         convertImageToString(_image).then((base64Image) {
//           // Use the base64Image string as needed
//           print(base64Image);
//         });
//       }
//     });
//   }

  File? _image;
  String _imageString = '';

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        _imageString = base64Encode(_image!.readAsBytesSync());
        // debugPrint('imageString: $_imageString');
      }
    });
  }

  // File? _image;

  // Future<void> _getImage() async {
  //   final imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  DateTime selectedDate = DateTime.now();

  void handleDateSelected(DateTime value) {
    setState(() {
      selectedDate = DateFormat('yyyy-MM-dd').parse(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, registerProvider, child) => Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0080FF),
          title: Text(
            'Informasi Tambahan',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 400,
                  height: 430,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selesaikan Profil Anda',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Bantu kami untuk mengetahui anda lebih dalam untuk memberikan rekomendasi yang tepat.',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: const Color(0xFF96989C),
                                  child: _image != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.file(
                                            _image!,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/images/person.png',
                                            color: Colors.black38,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _getImage,
                              child: const Text('Masukkan foto anda'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jenis Kelamin',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // const SizedBox(height: 10),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     prefixIcon: SvgPicture.asset(
                              //       'assets/icons/female_male.svg',
                              //       fit: BoxFit.scaleDown,
                              //     ),
                              //     hintText: 'Masukan Jenis Kelamin',
                              //     hintStyle: GoogleFonts.openSans(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w400,
                              //     ),
                              //     border: const OutlineInputBorder(),
                              //   ),
                              // ),
                              DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/female_male.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                        child: Text(
                                      'Pilih Jenis Kelamin',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                                  ],
                                ),
                                items: genders
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                value: selectGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectGender = value.toString();
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                    width: 296,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Tanggal Lahir',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              DatePickerTextField(
                                onDateSelected: handleDateSelected,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(350, 40),
                  ),
                ),
                onPressed: () async {
                  debugPrint(
                      'selectedDate: ${"${selectedDate.year.toString().padLeft(4, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}"}');
                  debugPrint('selectGender: $selectGender');
                  debugPrint('image: $_imageString');
                  debugPrint('birthDate: $selectedDate');
                  UserRegisterResponseModel userRegister =
                      UserRegisterResponseModel(
                    email: registerProvider.email,
                    fullName: registerProvider.fullName,
                    phoneNumber: registerProvider.phoneNumber,
                    password: registerProvider.password,
                    confirmPassword: registerProvider.confirmPassword,
                  );
                  await registerProvider.register(userRegister);
                  const snackBar = SnackBar(
                    content: Text('Berhasil disimpan'),
                    backgroundColor: Color(0xff0080FF),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LoginPage()));
                  }
                },
                child: const Text('Simpan'),
              ),
              TextButton(
                child: const Text('Lewati Bagian Ini'),
                onPressed: () async {
                  UserRegisterResponseModel userRegister =
                      UserRegisterResponseModel(
                    email: registerProvider.email,
                    fullName: registerProvider.fullName,
                    phoneNumber: registerProvider.phoneNumber,
                    password: registerProvider.password,
                    confirmPassword: registerProvider.confirmPassword,
                  );
                  await registerProvider.register(userRegister);
                  const snackBar = SnackBar(
                    content: Text('Berhasil disimpan'),
                    backgroundColor: Color(0xff0080FF),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
