import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/edit_profile/detail_picture_screen.dart';
import 'package:capstone_project_tripease/features_profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
  List<String> list = <String>[
    'Afghanistan',
    'Brunei Darussalam',
    'Canada',
    'Denmark',
    'Indonesia',
    'Netherlands'
  ];

  DateTime today = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? selectedDated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailPictureScreen(
                        title: 'Ubah Profile',
                      ),
                    ));
                  },
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundColor: const Color.fromRGBO(210, 215, 224, 1),
                    child: CircleAvatar(
                      radius: 47.r,
                      backgroundImage: AssetImage('assets/images/user.jfif'),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Sekar Mauliyah',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                'sekarm13@gmail.com',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 12.h),
              child: Text(
                'Nama Lengkap',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: null,
              initialValue: 'Sekar Mauliyah',
              keyboardType: TextInputType.text,
              style: GoogleFonts.openSans(fontSize: 14.sp, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
              controller: null,
              initialValue: '85792057054',
              keyboardType: TextInputType.phone,
              style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                prefixText: '+62 | ',
                prefixStyle: GoogleFonts.openSans(color: Colors.black),
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
              controller: null,
              initialValue: '01 - Agustus 2001',
              keyboardType: TextInputType.text,
              style:
                  GoogleFonts.openSans(fontSize: 14.sp.sp, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                suffixIcon: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28.r),
                          topRight: Radius.circular(28.r),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            DateTime selectedDate = DateTime.now();
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F0F8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(28.r),
                                  topRight: Radius.circular(28.r),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, top: 16.h),
                                      child: Text(
                                        'Pilih Tanggal',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.w, top: 36.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${DateFormat('EEEE, dd MMMM', 'id_ID').format(selectedDate)}',
                                            style: GoogleFonts.openSans(
                                              fontSize: 32.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 118.w,
                                          ),
                                          const Icon(Icons.edit),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                      thickness: 2,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(
                                      height: 524.h,
                                      width: 380.w,
                                      child: TableCalendar(
                                        selectedDayPredicate: (day) {
                                          return isSameDay(selectedDate, day);
                                        },
                                        firstDay: DateTime.utc(2010, 10, 16),
                                        lastDay: DateTime.utc(2030, 3, 14),
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          setState(() {
                                            selectedDate = selectedDay;
                                          });
                                        },
                                        focusedDay: selectedDate,
                                        locale:
                                            'id_ID', // Set locale ke Indonesia
                                        calendarFormat: calendarFormat,
                                        headerStyle: HeaderStyle(
                                          formatButtonTextStyle:
                                              GoogleFonts.openSans(
                                                  color: Colors.transparent),
                                          formatButtonDecoration:
                                              const BoxDecoration(
                                                  color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 252.w),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Batal',
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(selectedDated);
                                          },
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.date_range_rounded),
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
              height: 45.h,
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 16.w, right: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                border:
                    Border.all(color: const Color.fromRGBO(210, 215, 224, 1)),
              ),
              child: DropdownButton<String>(
                hint: Text(
                  'Indonesia',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, color: Colors.black),
                ),
                value: null,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                isExpanded: true,
                underline: const SizedBox(),
                onChanged: (String? value) {},
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30.h),
            ButtonActive(
              text: 'Simpan',
              onTap: () {
                const snackBar = SnackBar(
                  content: Center(
                    child: Text('Profil telah berhasil di simpan!'),
                  ),
                  backgroundColor: Color.fromRGBO(61, 175, 29, 1),
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
