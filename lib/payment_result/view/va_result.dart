import 'package:flutter/material.dart';
import 'package:hotel_1/payment_hotel/model/payment_page_model.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../list_hotel/model/list_hotel_model.dart';

class VirtualAccountPage extends StatelessWidget {
  final VirtualAccountOption virtualAccountOption;
  final Room room;
  final ListHotel list;

  const VirtualAccountPage({required this.virtualAccountOption, required this.room, required this.list}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(virtualAccountOption.title),
      ),
    );
  }
}
