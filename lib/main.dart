import 'package:capstone_project_tripease/kai/view_model/select_seat_kai_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/timer_seat_provider.dart';
import 'package:capstone_project_tripease/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerPaymentProvider>(
            create: (_) => TimerPaymentProvider()),
        ChangeNotifierProvider<TimerSeatProvider>(
            create: (_) => TimerSeatProvider()),
        ChangeNotifierProvider<SelectedSeatsProvider>(
            create: (_) => SelectedSeatsProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          supportedLocales: [
            Locale('id', 'ID'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}
