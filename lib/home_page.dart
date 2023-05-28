import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODUzNzA4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo1fQ.aUK7WYvOQn2UQiihHUYUuwd2WhKM9qR9NjXz6LmDC0A',
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
                      hintStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
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
                          style: TextStyle(
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
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Check notification settings',
                                style: TextStyle(
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
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 212.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 150.w,
                  height: 212.h,
                  margin: EdgeInsets.fromLTRB(20.w, 0, 0, 1.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 250, 251, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 0.1,
                        blurRadius: 0.7,
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(5.r)),
                        child: Image.asset(
                          'assets/images/hotel.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 110.h,
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shibuya Shabu',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on_outlined),
                                SizedBox(
                                  width: 112.w,
                                  child: Text(
                                    'Bangkok, Thailand asdasdasdasdasdasd',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                              ],
                            ),
                            Text(
                              'Rp 2.500.000',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              'Rp 1.960.000',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 115, 0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 24.h, left: 20.w, right: 20.w, bottom: 8.h),
            child: Text(
              'Hotel pilihan untuk anda',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 212.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 150.w,
                  height: 212.h,
                  margin: EdgeInsets.fromLTRB(20.w, 0, 0, 1.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 250, 251, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 0.1,
                        blurRadius: 0.7,
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(5.r)),
                        child: Image.asset(
                          'assets/images/hotel.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 110.h,
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'JW Marriot',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on_outlined),
                                SizedBox(
                                  width: 112.w,
                                  child: Text(
                                    'Jl. Putri Hijau No. 10 Medan, Indonesia',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: const Color.fromRGBO(255, 195, 0, 1),
                                ),
                              ],
                            ),
                            Text(
                              'Rp 2.500.000',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              'Rp 1.960.000',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 115, 0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 24.h, left: 20.w, right: 20.w, bottom: 8.h),
            child: Text(
              'Anda baru saja mencari',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 130.w,
                  height: 80.h,
                  margin: EdgeInsets.fromLTRB(20.w, 0, 0, 20.h),
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 250, 251, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 0.1,
                        blurRadius: 0.7,
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'BD',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              width: 30.w,
                              child: const Icon(Icons.arrow_forward_outlined)),
                          Text(
                            'JKTA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          'Rabu, 05 Apr - Kamis, 06 Apr',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
