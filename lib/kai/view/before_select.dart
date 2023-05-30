import 'package:capstone_project_tripease/kai/view/select_seat_kai.dart';
import 'package:capstone_project_tripease/kai/view_model/select_seat_kai_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BeforeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'pilih kursi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Kursi',
            style:
                GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<SelectSeatKaiController>(
          init: SelectSeatKaiController(),
          builder: (controller) => SelectSeatKai(),
        ),
      ),
    );
  }
}
