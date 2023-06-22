import 'package:capstone_project_tripease/features_order/apis/train/train_order_filter_api.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/coundown_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/hotel/hotel_order_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/hotel/hotel_order_update_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/tab_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/train/train_order_filter_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/train/train_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'features_order/utils/colors.dart';
import 'features_order/utils/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import 'features_order/view_model/provider/train/train_order_detail_provider.dart';
import 'features_order/view_model/provider/train/train_order_provider.dart';
import 'features_order/view_model/provider/train/train_order_update_provider.dart';
import 'home.dart';

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
        ChangeNotifierProvider(
          create: (context) => CountdownProvider(
            DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch,
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
