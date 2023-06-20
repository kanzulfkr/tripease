import 'package:capstone_project_tripease/features_kai/view_model/station/departure_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppbarInputData extends StatelessWidget {
  const AppbarInputData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DepartureProvider>(
      builder: (context, departureProv, child) {
        return SizedBox(
          width: 250.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${departureProv.departure[departureProv.selectedDepartIndex as int].route![0].station!.name}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '${departureProv.departure[departureProv.selectedDepartIndex as int].route![0].station!.initial}',
                    style: TextStyle(
                      fontSize: 12.sp,
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
                  size: 20.w,
                ),
              ),
              Column(
                children: [
                  Text(
                    '${departureProv.departure[departureProv.selectedDepartIndex as int].route![1].station!.name}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '${departureProv.departure[departureProv.selectedDepartIndex as int].route![1].station!.initial}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
