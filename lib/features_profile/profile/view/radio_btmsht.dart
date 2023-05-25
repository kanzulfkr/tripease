import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioBottomSheet extends StatefulWidget {
  const RadioBottomSheet({super.key});

  @override
  State<RadioBottomSheet> createState() => _RadioBottomSheetState();
}

class _RadioBottomSheetState extends State<RadioBottomSheet> {
  int selectedRadio = 0;
  @override
  void initSate() {
    selectedRadio = 0;
    super.initState();
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 180.h,
                          child: RadioMenuButton(
                            child: Text(
                              "Virtual Account",
                            ),
                            value: 0,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value as int;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 180.h,
                          child: RadioMenuButton(
                            child: Text(
                              "Virtual Account",
                            ),
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value as int;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('asdasd'),
            ),
            Row(
              children: [
                SizedBox(
                  width: 180.h,
                  child: RadioMenuButton(
                    child: Text(
                      "Virtual Account",
                    ),
                    value: 0,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      _handleRadioValueChange(val as int);
                    },
                  ),
                ),
                SizedBox(
                  width: 180.h,
                  child: RadioMenuButton(
                    child: Text(
                      "Virtual Account",
                    ),
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      _handleRadioValueChange(val as int);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
