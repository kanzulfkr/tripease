import 'package:capstone_project_tripease/features_home/widgets/for_you.dart';
import 'package:capstone_project_tripease/features_home/widgets/you_just_saw.dart';
import 'package:capstone_project_tripease/features_home/widgets/you_just_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool popUpNotification = true;

  Future<void> getDataWithDio() async {
    try {
      final response = await Dio().post(
        "http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1/user",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODUzNzA4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo1fQ.aUK7WYvOQn2UQiihHUYUuwd2WhKM9qR9NjXz6LmDC0A',
        }),
      );

      if (response.statusCode == 200) {
        print(response.data);
        print("${response.data['message']}");
      } else {
        print("${response.data['message']}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(18.h),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            width: double.infinity,
            height: 72.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 233.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for something',
                      hintStyle: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40.h,
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 40.h,
                  child: const Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    getDataWithDio();
                  },
                  child: Container(
                    height: 40.h,
                    width: 160.w,
                    padding: EdgeInsets.symmetric(horizontal: 32.5.w),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(51, 153, 255, 1),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8.h),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.train_outlined,
                          color: Colors.black,
                        ),
                        Text(
                          'Kereta Api',
                          style: GoogleFonts.openSans(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 160.w,
                    padding: EdgeInsets.symmetric(horizontal: 36.5.w),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 143, 51, 1),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8.h),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.apartment_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(width: 59.h, child: const Text('Hotel'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          popUpNotification
              ? Container(
                  height: 79.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 231, 153, 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/pop_up_notification.png',
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                      SizedBox(
                        width: 236.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Peringatan keamanan hilang, pembaruan pemesanan, dan balasan obrolan.',
                              style: GoogleFonts.openSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Check notification settings',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(0, 128, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            popUpNotification = !popUpNotification;
                          });
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Color.fromRGBO(113, 114, 117, 1),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: EdgeInsets.only(
                top: 24.h, left: 20.w, right: 20.w, bottom: 8.h),
            child: Text(
              'Anda baru saja melihat',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const YouJustSaw(),
          Padding(
            padding: EdgeInsets.only(
                top: 24.h, left: 20.w, right: 20.w, bottom: 8.h),
            child: Text(
              'Hotel pilihan untuk anda',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ForYou(),
          Padding(
            padding: EdgeInsets.only(
                top: 24.h, left: 20.w, right: 20.w, bottom: 8.h),
            child: Text(
              'Anda baru saja mencari',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const YouJustSearched(),
        ],
      ),
    );
  }
}
