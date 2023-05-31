import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../features_rincian_pesanan_hotel/view/pesanan_menunggu.dart';
import '../../../../../features_rincian_pesanan_ka/view/order_kai_failed_no_payment.dart';
import '../../../../../features_rincian_pesanan_ka/view/order_kai_pending.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';

class CardWaitKA extends StatelessWidget {
  CardWaitKA({
    super.key,
    required this.icon,
    required this.title,
    required this.nameStart,
    required this.iconForward,
    required this.nameFinish,
    required this.image,
    required this.iconLocation,
    required this.titleLocation,
    required this.iconSeat,
    required this.titleSeat,
    required this.iconDate,
    required this.titleDate,
    required this.nomorPesanan,
    required this.time,
  });

  SvgPicture icon;
  String title;
  String nameStart;
  Icon iconForward;
  String nameFinish;
  Image image;
  SvgPicture iconLocation;
  String titleLocation;
  SvgPicture iconSeat;
  String titleSeat;
  SvgPicture iconDate;
  String titleDate;
  String nomorPesanan;
  String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderKaiPendingPage(),
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
                        Text(
                          time,
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
                                      iconLocation,
                                      const SizedBox(width: 4),
                                      Text(
                                        titleLocation,
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
