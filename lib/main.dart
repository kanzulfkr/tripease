import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'hotel_home/model/hotel_home_model.dart';
import 'hotel_home/view/clone.dart';
import 'list_hotel/model/list_hotel_model.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      ChangeNotifierProvider<DateProvider>(
        create: (context) => DateProvider(),
        child: MyApp(),
      )
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
        ChangeNotifierProvider<SortingOption>(
          create: (context) => SortingOption('Pilih'),
        ),
        // ChangeNotifierProvider<AnotherFilter>(
        //   create: (context) => AnotherFilter(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HotelHome(),
      )
    );
  }
}


