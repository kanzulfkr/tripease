import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_1/features_home/view_%20model/hotel_recommendation_provider.dart';
import 'package:hotel_1/onboard_feature/view/splash.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'package:provider/provider.dart';

import 'features_home/view_ model/hotel_seen_provider.dart';
import 'features_profile/view_model/article_provider.dart';
import 'features_profile/view_model/user_profile_provider.dart';
import 'hotel_features/detail_hotel/viewmodel/detail_hotel_provider.dart';
import 'hotel_features/detail_kamar/viewmodel/hotel_room_detail_provider.dart';
import 'hotel_features/hotel_home/model/hotel_home_model.dart';

import 'hotel_features/hotel_home/viewmodel/list_address_provider.dart';
import 'hotel_features/hotel_home/viewmodel/search_hotel_provider.dart';
import 'hotel_features/input_guest/viewmodel/input_guest_provider.dart';
import 'hotel_features/payment_hotel/viewmodel/order_viewmodel.dart';
import 'hotel_features/payment_hotel/viewmodel/payment_hotel_viewmodel.dart';
import 'hotel_features/payment_result/viewmodel/patch_order_viewmodel.dart';
import 'hotel_features/payment_result/viewmodel/payment_result_viewmodel.dart';
import 'onboard_feature/view_model/login_provider.dart';
import 'onboard_feature/view_model/register_provider.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(ChangeNotifierProvider<DateProvider>(
      create: (context) => DateProvider(),
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider<SearchProvider>(
                  create: (context) => SearchProvider()),
              ChangeNotifierProvider<AddressProvider>(
                  create: (context) => AddressProvider()),
              ChangeNotifierProvider<DetailHotelProvider>(
                  create: (context) => DetailHotelProvider()),
              ChangeNotifierProvider<DetailHotelRoomProvider>(
                  create: (context) => DetailHotelRoomProvider()),
              ChangeNotifierProvider<InputGuestProvider>(
                  create: (context) => InputGuestProvider()),
              ChangeNotifierProvider(
                  create: (context) => PaymentHotelProvider()),
              ChangeNotifierProvider<DetailPaymentProvider>(
                  create: (context) => DetailPaymentProvider()),
              ChangeNotifierProvider<OrderProviderHotel>(
                  create: (context) => OrderProviderHotel()),
              ChangeNotifierProvider<PatchOrderProvider>(
                  create: (context) => PatchOrderProvider()),
              ChangeNotifierProvider(create: (_) => LoginProvider()),
              ChangeNotifierProvider(create: (_) => RegisterProvider()),
              ChangeNotifierProvider(create: (_) => UserProfileProvider()),
              ChangeNotifierProvider(create: (_) => ArticleProvider()),
              ChangeNotifierProvider(create: (context) => HotelSeenProvider()),
              ChangeNotifierProvider(
                  create: (context) => HotelRecommendProvider())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashScreen(),
            ));
      },
    );
  }
}
