import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../features_rincian_pesanan_hotel/view/pesanan_aktif.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';

class CardActiveHotel extends StatelessWidget {
  CardActiveHotel({
    super.key,
    required this.icon,
    required this.title,
    required this.name,
    required this.image,
    required this.iconLocation,
    required this.titleLocation,
    required this.iconBed,
    required this.titleBed,
    required this.iconBedTime,
    required this.titleBedTime,
    required this.iconDate,
    required this.titleDate,
    required this.nomorPesanan,
  });

  SvgPicture icon;
  String title;
  String name;
  Image image;
  SvgPicture iconLocation;
  String titleLocation;
  SvgPicture iconBed;
  String titleBed;
  SvgPicture iconBedTime;
  String titleBedTime;
  SvgPicture iconDate;
  String titleDate;
  String nomorPesanan;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PesananAktif(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
            child: Container(
              decoration: BoxDecoration(
                color: background,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 1.w, // Use ScreenUtil for spreadRadius
                    blurRadius: 3.w, // Use ScreenUtil for blurRadius
                    offset: Offset(1.w, 1.w), // Use ScreenUtil for offset
                  ),
                ],
                borderRadius: BorderRadius.circular(
                    8.w), // Use ScreenUtil for borderRadius
              ),
              height: 205.h, // Use ScreenUtil for height
              width: 350.w, // Use ScreenUtil for width
              child: Padding(
                padding: EdgeInsets.all(20.w), // Use ScreenUtil for padding
                child: Column(
                  children: [
                    Row(
                      children: [
                        icon,
                        SizedBox(width: 5.w), // Use ScreenUtil for width
                        Text(
                          title,
                          style: myTextTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h), // Use ScreenUtil for height
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              4.w), // Use ScreenUtil for borderRadius
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(
                                48.w), // Use ScreenUtil for size
                            child: image,
                          ),
                        ),
                        SizedBox(width: 20.w), // Use ScreenUtil for width
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: myTextTheme.displayMedium,
                              ),
                              SizedBox(
                                  height: 10.h), // Use ScreenUtil for height
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      iconLocation,
                                      SizedBox(
                                          width:
                                              4.w), // Use ScreenUtil for width
                                      Text(
                                        titleLocation,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconBed,
                                      SizedBox(
                                          width:
                                              5.w), // Use ScreenUtil for width
                                      Text(
                                        titleBed,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconBedTime,
                                      SizedBox(
                                          width:
                                              5.w), // Use ScreenUtil for width
                                      Text(
                                        titleBedTime,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconDate,
                                      SizedBox(
                                          width:
                                              5.w), // Use ScreenUtil for width
                                      Text(
                                        titleDate,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h), // Use ScreenUtil for height
                    const Divider(
                      color: black,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Nomor Pesanan :',
                            style: myTextTheme.bodySmall,
                          ),
                          SizedBox(width: 5.w), // Use ScreenUtil for width
                          Text(
                            nomorPesanan,
                            style: myTextTheme.bodySmall,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
