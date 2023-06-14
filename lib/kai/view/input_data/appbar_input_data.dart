import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/station_provider.dart';

class AppbarInputData extends StatelessWidget {
  const AppbarInputData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StationProvider>(
      builder: (context, stationProvider, child) {
        return SizedBox(
          width: 260,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    stationProvider.getNameOrigin!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    stationProvider.getInitialOrigin!,
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
                    stationProvider.getNameDestination!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    stationProvider.getInitialDestination!,
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
      },
    );
  }
}
