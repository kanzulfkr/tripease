import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistorySearch extends StatefulWidget {
  const HistorySearch({super.key});

  @override
  State<HistorySearch> createState() => _HistorySearchState();
}

class _HistorySearchState extends State<HistorySearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Histori pencarian'),
        Container(
          height: 400.h,
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Text('Medan');
            },
          ),
        )
      ],
    );
  }
}
