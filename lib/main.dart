import 'package:capstone_project_tripease/features_checkin_checkout/reviews.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'features_order/utils/colors.dart';
import 'features_order/utils/fonts.dart';
import 'features_order/view/widgets/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TabProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: mainBlue,
                centerTitle: true,
              ),
              scaffoldBackgroundColor: background,
              fontFamily: GoogleFonts.openSans().fontFamily,
              textTheme: myTextTheme,
            ),
            home: const Home(),
          );
        },
      ),
    );
  }
}
