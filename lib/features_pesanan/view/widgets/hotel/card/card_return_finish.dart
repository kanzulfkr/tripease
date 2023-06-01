import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../features_rincian_pesanan_hotel/view/pesanan_kembali_berhasil.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';

class CardReturnFinishHotel extends StatelessWidget {
  CardReturnFinishHotel({
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PesananKembaliBerhasil(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
            child: Container(
              decoration: BoxDecoration(
                color: background,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(1, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              height: ScreenUtil().setHeight(205),
              width: ScreenUtil().setWidth(350),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        icon,
                        const SizedBox(width: 5),
                        Text(
                          title,
                          style: myTextTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(19)),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(ScreenUtil().setWidth(48)),
                            child: image,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: myTextTheme.displayMedium,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      iconLocation,
                                      SizedBox(width: ScreenUtil().setWidth(4)),
                                      Text(
                                        titleLocation,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconBed,
                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                      Text(
                                        titleBed,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconBedTime,
                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                      Text(
                                        titleBedTime,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconDate,
                                      SizedBox(width: ScreenUtil().setWidth(5)),
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
                    SizedBox(height: ScreenUtil().setHeight(5)),
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
                          SizedBox(width: ScreenUtil().setWidth(5)),
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
