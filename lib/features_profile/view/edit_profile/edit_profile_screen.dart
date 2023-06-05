// ignore: depend_on_referenced_packages
import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/edit_profile/edit_photo_screen.dart';
import 'package:capstone_project_tripease/features_profile/view/widgets/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/view_model/user_profile_provider.dart';
import 'package:capstone_project_tripease/main_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> listCitizen = <String>[
    'Australia',
    'Malaysia',
    'Filiphina',
    'Indonesia',
    'Brunei Darussalam',
    'Singapura',
  ];

  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController citizenController = TextEditingController();

  String? selectedValue;
  DateTime today = DateTime.now();
  DateTime confirmDated = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  bool isActive = false;

  @override
  void dispose() {
    fullNameController;
    phoneNumberController;
    birthDateController;
    citizenController;
    super.dispose();
  }

  void isSelectedDay() {
    birthDateController.text =
        DateFormat('yyyy-MM-dd', 'id_ID').format(confirmDated);
  }

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProfileProvider>(context, listen: false);
    user.getUserProfile();

    fullNameController.text = user.result!.fullName ?? '';
    phoneNumberController.text = user.result!.phoneNumber ?? '';
    birthDateController.text = user.result!.birthDate ?? '';
    citizenController.text = user.result!.citizen ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfileProvider>(context);
    void _showDateBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.sp, left: 24.sp, bottom: 24.sp),
                    child: Text(
                      'Pilih Tanggal',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('EEEE, dd MMMM', 'id_ID').format(today),
                          style: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 50.w, child: const Icon(Icons.edit)),
                      ],
                    ),
                  ),
                  TableCalendar(
                    selectedDayPredicate: (day) {
                      return isSameDay(today, day);
                    },
                    firstDay: DateTime.utc(1900, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        today = selectedDay;
                        confirmDated = selectedDay;
                        print(confirmDated);
                      });
                    },
                    focusedDay: today,
                    locale: 'id_ID', // Set locale ke Indonesia
                    calendarFormat: CalendarFormat.month,
                    headerStyle: const HeaderStyle(
                      formatButtonTextStyle:
                      TextStyle(color: Colors.transparent),
                      formatButtonDecoration:
                      BoxDecoration(color: Colors.transparent),
                    ),
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      todayTextStyle: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: const Color.fromRGBO(0, 128, 255, 1),
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 128, 255, 1),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromRGBO(0, 128, 255, 1),
                          width: 2.0.w,
                        ),
                      ),
                    ),
                    onPageChanged: (focusedDay) {
                      setState(() {
                        today = focusedDay;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Batal',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          isSelectedDay();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return Consumer<UserProfileProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
          title: Text(
            widget.title,
            style: GoogleFonts.openSans(
                fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  isActive = true;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 20.sp),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EditPhotoScreen(
                              title: 'Ubah Profile',
                            ),
                          ));
                        },
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50.r,
                              backgroundColor:
                              const Color.fromARGB(255, 224, 226, 231),
                              child: user.loading
                                  ? SizedBox(
                                  height: 100.h,
                                  width: 100.w,
                                  child: const CircularProgressIndicator())
                                  : CircleAvatar(
                                radius: 47.r,
                                backgroundImage:
                                // AssetImage('assets/images/user.jfif'),
                                NetworkImage(
                                  user.result!.profilePictureUrl ?? '',
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.sp,
                              right: 0.sp,
                              child: CircleAvatar(
                                radius: 15.r,
                                backgroundColor:
                                const Color.fromRGBO(240, 240, 248, 1),
                                child: const Icon(
                                  Icons.border_color_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      user.loading ? '' : user.result!.fullName ?? '',
                      style: GoogleFonts.openSans(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Text(
                      user.loading ? '' : user.result!.email ?? '',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.sp, bottom: 12.sp),
                    child: Text(
                      'Nama Lengkap',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: fullNameController,
                    // initialValue: user.result!.fullName,
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Nama lengkap',
                      hintStyle: GoogleFonts.openSans(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    // onChanged: (String value) {
                    //   if (value != '${user.result!.fullName}') {
                    //     setState(() {
                    //       isFullNameChange = true;
                    //     });
                    //   } else if (value == '${user.result!.fullName}') {
                    //     setState(() {
                    //       isFullNameChange = false;
                    //     });
                    //   }
                    // },
                    validator: (fullName) {
                      if (fullName == null || fullName.isEmpty) {
                        return 'Nama Lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                    child: Text(
                      'Nomor Telepon',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    style:
                    GoogleFonts.openSans(fontSize: 14.sp, color: Colors.black),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      hintText: '6287XXXXXXX',
                      hintStyle: GoogleFonts.openSans(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {},
                    validator: (phoneNumber) {
                      if (phoneNumber == null || phoneNumber.isEmpty) {
                        return 'Nomor Telepon tidak boleh kosong';
                      } else if (phoneNumber.length > 13) {
                        return 'Nomor Telepon tidak sesuai format';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                    child: Text(
                      'Tanggal Lahir',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: true,
                    controller: birthDateController,
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp.sp, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'dd-mm-yyyy',
                      hintStyle: GoogleFonts.openSans(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      suffixIcon: InkWell(
                        onTap: () {
                          _showDateBottomSheet();
                        },
                        child: const Icon(
                          Icons.date_range_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        birthDateController.text = value.toString();
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                    child: Text(
                      'Kewarganegaraan',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: citizenController,
                          readOnly: true,
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Pilih Negara',
                            hintStyle: GoogleFonts.openSans(color: Colors.grey),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                          ),
                          openMenuIcon: Icon(Icons.arrow_drop_up),
                        ),
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (String? value) {
                          setState(() {
                            citizenController.text = value.toString();
                          });
                        },
                        items: listCitizen
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  isActive
                      ? ButtonActive(
                    text: 'Simpan',
                    onTap: () async {
                      String fullName = fullNameController.text;
                      String phoneNumber = phoneNumberController.text;
                      String birthDate = birthDateController.text;
                      String citizen = citizenController.text;

                      if (_formKey.currentState!.validate()) {
                        await value.updateUserProfile(
                            fullName, phoneNumber, birthDate, citizen);
                        if (value.updateStatus == UpdateStatus.success) {
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
                          }
                        } else if (value.updateStatus ==
                            UpdateStatus.error) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Profil telah berhasil di simpan'),
                              ),
                            );
                          }
                        }

                        const snackBar = SnackBar(
                          content: Center(
                            child: Text(
                              'Profil telah berhasil di simpan',
                            ),
                          ),
                          backgroundColor: Color.fromRGBO(61, 175, 29, 1),
                          showCloseIcon: true,
                          closeIconColor: Colors.white,
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      }
                    },
                  )
                      : ButtonInactive(
                    text: 'Simpan',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
