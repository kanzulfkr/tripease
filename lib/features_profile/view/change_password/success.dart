import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:capstone_project_tripease/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/undraw_success.svg',
              ),
              SizedBox(height: 32.h),
              Text(
                'Sukses mengubah Kata Sandi',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              Text(
                'Kata Sandi telah diubah',
                style: GoogleFonts.openSans(
                    fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 64.h),
              ButtonActive(
                text: 'Selesai',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
