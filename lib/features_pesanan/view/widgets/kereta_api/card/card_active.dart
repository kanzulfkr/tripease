import 'package:capstone_project_tripease/features_pesanan/view/screens/beranda_screen.dart';
import 'package:capstone_project_tripease/features_rincian_pesanan_ka/view/order_detail_kai.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../features_rincian_pesanan_hotel/view/pesanan_aktif.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';

class CardActiveKA extends StatelessWidget {
  CardActiveKA({
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
  Icon iconForward;
  String nameFinish;
  Image image;
  String titleTrain;
  SvgPicture iconTrain;
  SvgPicture iconSeat;
  String titleSeat;
  SvgPicture iconDate;
  String titleDate;
  String nomorPesanan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderDetailKai(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
              height: 205,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                    const SizedBox(height: 19),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(4), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: image,
                          ),
                        ),
                        const SizedBox(width: 20),
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
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      iconTrain,
                                      const SizedBox(width: 5),
                                      Text(
                                        titleTrain,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconSeat,
                                      const SizedBox(width: 5),
                                      Text(
                                        titleSeat,
                                        style: myTextTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconDate,
                                      const SizedBox(width: 5),
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
                    const SizedBox(height: 5),
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
                          const SizedBox(width: 5),
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
