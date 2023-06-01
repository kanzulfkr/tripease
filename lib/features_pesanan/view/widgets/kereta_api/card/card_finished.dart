import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../features_rincian_pesanan_ka/view/order_kai_done.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';

class CardFinishKA extends StatelessWidget {
  CardFinishKA({
    super.key,
    required this.icon,
    required this.title,
    required this.nameStart,
    required this.iconForward,
    required this.nameFinish,
    required this.image,
    required this.iconTrain,
    required this.titleTrain,
    required this.iconSeat,
    required this.titleSeat,
    required this.iconDate,
    required this.titleDate,
    required this.nomorPesanan,
  });

  SvgPicture icon;
  String title;
  String nameStart;
  String nameFinish;
  Image image;
  String titleTrain;
  SvgPicture iconTrain;
  SvgPicture iconSeat;
  String titleSeat;
  SvgPicture iconDate;
  String titleDate;
  String nomorPesanan;
  Icon iconForward;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
   return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderKaiDonePage(),
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
                    offset: Offset(1.w, 1.w),
                  ),
                ],
                borderRadius: BorderRadius.circular(8.w),
              ),
              height: 215.h,
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
                          style: myTextTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.w),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48.w),
                            child: image,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    nameStart,
                                    style: myTextTheme.displayMedium,
                                  ),
                                  iconForward,
                                  Text(
                                    nameFinish,
                                    style: myTextTheme.displayMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      iconTrain,
                                      SizedBox(width: 5.w),
                                      Text(
                                        titleTrain,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconSeat,
                                      SizedBox(width: 5.w),
                                      Text(
                                        titleSeat,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconDate,
                                      SizedBox(width: 5.w),
                                      Text(
                                        titleDate,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Divider(color: black),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Nomor Pesanan :',
                            style: myTextTheme.bodySmall,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            nomorPesanan,
                            style: myTextTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
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
