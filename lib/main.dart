import 'package:hotel_1/selected_tab.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'features_kai/view_model/order_ticket/patch_order_provider.dart';
import 'features_kai/view_model/order_ticket/payment_provider.dart';
import 'features_kai/view_model/order_ticket/response_order_train_provider.dart';
import 'features_kai/view_model/station/history_station_provider.dart';
import 'features_kai/view_model/timer/time_payment_provider.dart';
import 'features_kai/view_model/timer/timer_seat_provider.dart';
import 'features_kai/view_model/train/train_provider.dart';
import 'features_onboard/view/splash.dart';
import 'features_onboard/view_model/register_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'features_onboard/view_model/login_provider.dart';

import '/features_profile/view_model/user_profile_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features_kai/view_model/carriage/carriage_departure_provider.dart';
import 'features_kai/view_model/carriage/carriage_return_provider.dart';
import 'features_kai/view_model/carriage/select_seat_departure_provider.dart';
import 'features_kai/view_model/carriage/select_seat_return_provider.dart';
import 'features_kai/view_model/order_ticket/order_train_provider.dart';
import 'features_kai/view_model/station/departure_provider.dart';
import 'features_kai/view_model/station/return_provider.dart';
import 'features_kai/view_model/station/station_provider.dart';

import 'features_home/view_ model/hotel_seen_provider.dart';
import 'features_order/view_model/provider/coundown_provider.dart';
import 'features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import 'features_order/view_model/provider/hotel/hotel_order_provider.dart';
import 'features_order/view_model/provider/hotel/hotel_order_update_provider.dart';
import 'features_order/view_model/provider/tab_provider.dart';
import 'features_order/view_model/provider/train/train_order_detail_provider.dart';
import 'features_order/view_model/provider/train/train_order_filter_provider.dart';
import 'features_order/view_model/provider/train/train_order_provider.dart';
import 'features_order/view_model/provider/train/train_order_update_provider.dart';
import 'features_order/view_model/provider/train/train_search_provider.dart';
import 'features_profile/view_model/article_provider.dart';

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

import 'package:hotel_1/features_home/view_%20model/hotel_recommendation_provider.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      ChangeNotifierProvider<DateProvider>(
        create: (context) => DateProvider(),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          ChangeNotifierProvider(create: (context) => PaymentHotelProvider()),
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
          ChangeNotifierProvider(create: (context) => HotelRecommendProvider()),
          // select seat
          ChangeNotifierProvider(
              create: (_) => SelectedSeatsDepartureProvider()),
          ChangeNotifierProvider(create: (_) => SelectedSeatsReturnProvider()),
          // station,shedule
          ChangeNotifierProvider(create: (_) => StationProvider()),
          ChangeNotifierProvider(create: (_) => DepartureProvider()),
          ChangeNotifierProvider(create: (_) => ReturnProvider()),
          ChangeNotifierProvider(create: (_) => HistoryStationProvider()),
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
          ChangeNotifierProvider(create: (_) => TimerSeatProvider()),
          ChangeNotifierProvider(
            create: (context) => TabProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CountdownProvider(
              DateTime.now()
                  .add(const Duration(hours: 1))
                  .millisecondsSinceEpoch,
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainSearchProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainOrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainOrderDetailProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HotelOrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HotelOrderDetailProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => StatusOrderHotelUpdateProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => StatusOrderTrainUpdateProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainSearchProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainOrderFilterProvider(),
          ),
          ChangeNotifierProvider(create: (context) => NavBarProvider())
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          builder: (BuildContext context, Widget? widget) => MaterialApp(
            supportedLocales: const [
              Locale('id', 'ID'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          ),
        ));
  }
}
