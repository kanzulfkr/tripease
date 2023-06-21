import 'package:capstone_project_tripease/features_home/widgets/for_you.dart';
import 'package:capstone_project_tripease/features_home/widgets/you_just_saw.dart';
import 'package:capstone_project_tripease/features_home/widgets/you_just_search.dart';
import 'package:capstone_project_tripease/features_kai/view/ka_page/ka_page.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/station_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool popUpNotification = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
          actions: [
            IconButton(
              padding: EdgeInsets.only(top: 12.sp, bottom: 8.sp),
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Add your notification button action here
              },
            ),
            SizedBox(
              width: 30.25.w,
            ),
            IconButton(
              padding: EdgeInsets.only(top: 12.sp, bottom: 8.sp),
              icon: const Icon(Icons.chat),
              onPressed: () {
                // Add your chat button action here
              },
            ),
            SizedBox(
              width: 18.96.w,
            ),
          ],
          title: PreferredSize(
            preferredSize: Size.fromHeight(48.0.h),
            child: Padding(
              padding: EdgeInsets.only(top: 12.sp, right: 19.75.sp),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pencarian',
                  hintStyle: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 4.sp),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
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
                    Provider.of<StationProvider>(context, listen: false)
                        .setAsalController('');
                    Provider.of<StationProvider>(context, listen: false)
                        .setTujuanController('');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const KaPage();
                      },
                    ));
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
