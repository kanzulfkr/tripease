import 'package:flutter/material.dart';

class AppbarInputData extends StatelessWidget {
  const AppbarInputData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 260,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bandung',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'BD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 20,
            ),
          ),
          Column(
            children: [
              Text(
                'Cicalengka',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'CLK',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
