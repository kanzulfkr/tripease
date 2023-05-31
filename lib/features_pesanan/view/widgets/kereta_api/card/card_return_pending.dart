import 'package:capstone_project_tripease/features_rincian_pesanan_ka/view/order_kai_cancelled.dart';
import 'package:capstone_project_tripease/features_rincian_pesanan_ka/view/order_kai_refund_pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../features_rincian_pesanan_hotel/view/pesanan_batal.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';

class CardReturnKAPending extends StatelessWidget {
  CardReturnKAPending({
    super.key,
    required this.icon,
    required this.title,
    required this.nameStrat,
    required this.iconForward,
    required this.nameFinish,
    required this.image,
    required this.iconTrain,
    required this.titleTrain,
    required this.iconSeat,
    required this.titleSeats,
    required this.iconDate,
    required this.titleDate,
    required this.nomorPesanan,
  });

  SvgPicture icon;
  String title;
  String nameStrat;
  Icon iconForward;
  String nameFinish;
  Image image;
  SvgPicture iconTrain;
  String titleTrain;
  SvgPicture iconSeat;
  String titleSeats;
  SvgPicture iconDate;
  String titleDate;
  String nomorPesanan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderKaiRefundPendingPage(),
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
                          style: myTextTheme.displaySmall,
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
                                    nameStrat,
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
                                      const SizedBox(width: 3),
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
                                        titleSeats,
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
