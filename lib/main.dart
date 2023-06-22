import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/payment_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/patch_order_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/response_order_train_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/timer/time_payment_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:capstone_project_tripease/features_profile/view_model/article_provider.dart';
import '/onboard_feature/view/splash.dart';
import '/onboard_feature/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features_kai/view_model/carriage/carriage_departure_provider.dart';
import 'features_kai/view_model/carriage/carriage_return_provider.dart';
import 'features_kai/view_model/carriage/select_seat_return_provider.dart';
import 'features_kai/view_model/order_ticket/order_train_provider.dart';
import 'features_kai/view_model/carriage/select_seat_departure_provider.dart';
import 'features_kai/view_model/station/departure_provider.dart';
import 'features_kai/view_model/station/return_provider.dart';
import 'features_kai/view_model/station/station_provider.dart';
import 'features_kai/view_model/timer/timer_seat_provider.dart';
import 'onboard_feature/view_model/login_provider.dart';
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
        // user,login,register
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
        ChangeNotifierProvider(create: (_) => TimerSeatProvider()),
        // select seat
        ChangeNotifierProvider(create: (_) => SelectedSeatsDepartureProvider()),
        ChangeNotifierProvider(create: (_) => SelectedSeatsReturnProvider()),
        // station,shedule
        ChangeNotifierProvider(create: (_) => StationProvider()),
        ChangeNotifierProvider(create: (_) => DepartureProvider()),
        ChangeNotifierProvider(create: (_) => ReturnProvider()),
        // order
        ChangeNotifierProvider(create: (_) => PostOrderTrainProvider()),
        ChangeNotifierProvider(create: (_) => ResponseOrderTrainProvider()),
        ChangeNotifierProvider(create: (_) => PatchTrainProvider()),
        // carriage
        ChangeNotifierProvider(create: (_) => CarriageDepartureProvider()),
        ChangeNotifierProvider(create: (_) => CarriageReturnProvider()),
        // train
        ChangeNotifierProvider(create: (_) => TrainProvider()),
        // payment
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        // timer
        ChangeNotifierProvider(create: (_) => TimerPaymentProvider()),
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
