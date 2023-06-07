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
    ScreenUtil.init(context);
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
            padding: EdgeInsets.all(16.w),
            child: Container(
              decoration: BoxDecoration(
                color: background,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 1.w,
                    blurRadius: 3.w,
                    offset: const Offset(1, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(8.r),
              ),
              // height:205.h,
              width: 350.w,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        icon,
                        SizedBox(width: 5.w),
                        Text(
                          title,
                          style: myTextTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48.r),
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
                                      Expanded(
                                        child: Text(
                                          titleLocation,
                                          style: myTextTheme.headlineSmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
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
