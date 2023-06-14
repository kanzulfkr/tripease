import 'package:buttons_tabbar/buttons_tabbar.dart';


import 'package:capstone_project_tripease/features_order/view_model/provider/data_provider.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_detail_kai.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_cancelled.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_done.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_pending.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_refund_pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/train_model.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';

class KeretaApi extends StatefulWidget {
  const KeretaApi({
    super.key,
  });

  @override
  State<KeretaApi> createState() => _KeretaApiState();
}

class _KeretaApiState extends State<KeretaApi>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TabStatusTrain _currentTab = TabStatusTrain.SEMUA;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  List<CardTrain> getFilteredCardTrains() {
    switch (_currentTab) {
      case TabStatusTrain.MENUNGGU:
        return CardTrain.cardTrain
            .where((card) => card.title == 'MENUNGGU PEMBAYARAN -')
            .toList();
      case TabStatusTrain.AKTIF:
        return CardTrain.cardTrain
            .where((card) => card.title == 'SUDAH DIBAYAR')
            .toList();
      case TabStatusTrain.SELESAI:
        return CardTrain.cardTrain
            .where((card) => card.title == 'PESANAN SELESAI')
            .toList();
      case TabStatusTrain.DIBATALKAN:
        return CardTrain.cardTrain
            .where((card) => card.title == 'PESANAN DIBATALKAN')
            .toList();
      case TabStatusTrain.PENGEMBALIAN:
        return CardTrain.cardTrain
            .where((card) => card.title == 'DALAM PROSES PENGEMBALIAN')
            .toList();
      case TabStatusTrain.SEMUA:
      default:
        return CardTrain.cardTrain;
    }
  }

  Color getIconColor(SvgPicture icon) {
    if (icon == iconCheck) {
      return green;
    } else if (icon == iconSchedule) {
      return kuning;
    } else if (icon == iconPesananSelesai) {
      return orange;
    } else if (icon == iconCencel) {
      return red;
    } else {
      return black;
    }
  }

  void navigateToDetailPage(CardTrain card) {
    Widget destinationPage;

    switch (card.title) {
      case 'MENUNGGU PEMBAYARAN -':
        destinationPage = const OrderKaiPendingPage();
        break;
      case 'SUDAH DIBAYAR':
        destinationPage = const OrderDetailKai();
        break;
      case 'PESANAN SELESAI':
        destinationPage = const OrderKaiDonePage();
        break;
      case 'PESANAN DIBATALKAN':
        destinationPage = const OrderKaiCancelledPage();
        break;
      case 'DALAM PROSES PENGEMBALIAN':
        destinationPage = const OrderKaiRefundPendingPage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context, listen: false);
    tabProvider.setActiveTabIndex(1);

    ScreenUtil.init(context);
    return Container(
      color: background,
      child: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: background,
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.5),
                          spreadRadius: 1.w,
                          blurRadius: 5.w,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: ButtonsTabBar(
                        radius: 50.0.r,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                        backgroundColor: mainBlue,
                        unselectedBackgroundColor: background,
                        labelStyle: myTextTheme.labelLarge,
                        unselectedLabelStyle: myTextTheme.labelMedium,
                        borderColor: grey,
                        borderWidth: .3,
                        controller: _tabController,
                        tabs: const [
                          Tab(text: 'Semua'),
                          Tab(text: 'Menunggu'),
                          Tab(text: 'Aktif'),
                          Tab(text: 'Selesai'),
                          Tab(text: 'Dibatalkan'),
                          Tab(text: 'Pengembalian'),
                        ],
                        onTap: (index) {
                          setState(() {
                            _currentTab = TabStatusTrain.values[index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: getFilteredCardTrains().length,
                  itemBuilder: (context, index) {
                    final cardTrain = getFilteredCardTrains()[index];
                    return InkWell(
                      onTap: () {
                        navigateToDetailPage(cardTrain);
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
                              width: 350.w,
                              child: Padding(
                                padding: EdgeInsets.all(20.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        cardTrain.icon!,
                                        SizedBox(width: 5.w),
                                        Expanded(
                                          child: Text(
                                            cardTrain.title!,
                                            style:
                                                myTextTheme.titleLarge?.copyWith(
                                              color:
                                                  getIconColor(cardTrain.icon!),
                                            ),
                                          ),
                                        ),
                                        if (cardTrain.title ==
                                          'MENUNGGU PEMBAYARAN -')
                                          Expanded(
                                            child: CountdownTimer(
                                              endTime: cardTrain.paymentTime!,
                                              textStyle: myTextTheme.titleLarge
                                                  ?.copyWith(
                                                color: getIconColor(
                                                    cardTrain.icon!),
                                              ),
                                              onEnd: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        'Waktu Habis',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color: black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      content: Text(
                                                        'Pesanan Dibatalkan',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color: black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            'Tutup',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              color: mainBlue,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                setState(() {
                                                  cardTrain.title =
                                                      'PESANAN DIBATALKAN';
                                                  cardTrain.icon = iconCencel;
                                                });
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          child: SizedBox.fromSize(
                                            size: Size.fromRadius(48.r),
                                            child: CardTrain
                                                .cardTrain[index].image,
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    cardTrain.nameStart!,
                                                    style: myTextTheme
                                                        .displayMedium,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  cardTrain.forward!,
                                                  Expanded(
                                                    child: Text(
                                                      cardTrain.nameFinish!,
                                                      style: myTextTheme
                                                          .displayMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      cardTrain.train!,
                                                      SizedBox(width: 5.w),
                                                      Expanded(
                                                        child: Text(
                                                          cardTrain.nameTrain!,
                                                          style: myTextTheme
                                                              .headlineSmall,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      cardTrain.seat!,
                                                      SizedBox(width: 5.w),
                                                      Expanded(
                                                        child: Text(
                                                          cardTrain.nameSeat!,
                                                          style: myTextTheme
                                                              .headlineSmall,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      cardTrain.dateTime!,
                                                      SizedBox(width: 5.w),
                                                      Expanded(
                                                        child: Text(
                                                          cardTrain
                                                              .nameDateTime!,
                                                          style: myTextTheme
                                                              .headlineSmall,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
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
                                    SizedBox(height: 5.h),
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
                                          SizedBox(width: 5.w),
                                          Text(
                                            cardTrain.noPesanan!,
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
