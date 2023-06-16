import 'package:capstone_project_tripease/features_profile/view_model/article_provider.dart';

import 'features_onboard/view/splash.dart';
import 'features_onboard/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features_onboard/view_model/login_provider.dart';
import 'package:capstone_project_tripease/features_profile/view_model/user_profile_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return const MaterialApp(
            supportedLocales: [
              Locale('id', 'ID'),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
