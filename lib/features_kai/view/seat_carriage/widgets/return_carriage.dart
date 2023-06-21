import 'package:flutter/material.dart';

class SelectSeatReturnCarriage extends StatefulWidget {
  const SelectSeatReturnCarriage({super.key});

  @override
  State<SelectSeatReturnCarriage> createState() =>
      _SelectSeatReturnCarriageState();
}

class _SelectSeatReturnCarriageState extends State<SelectSeatReturnCarriage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
            InkWell(onTap: () => Navigator.pop(context), child: Text('asdasd')),
      ),
    );
  }
}
