import '/onboard_feature/view/splash.dart';
import '/onboard_feature/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'onboard_feature/view_model/login_provider.dart';

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
        ChangeNotifierProvider(create: (_) => RegisterProvider())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
