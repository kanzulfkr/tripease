import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:capstone_project_tripease/features_rincian_pesanan_hotel/view/order_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../features_rincian_pesanan_hotel/view/order_active.dart';
import '../../../features_rincian_pesanan_hotel/view/order_cancceled.dart';
import '../../../features_rincian_pesanan_hotel/view/order_pending.dart';
import '../../../features_rincian_pesanan_ka/view/order_kai_refund_pending.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';

import '../../view_model/provider/data_provider.dart';
import 'card_hotel.dart';

class Hotel extends StatefulWidget {
  const Hotel({
    super.key,
  });

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TabStatusHotel _currentTab = TabStatusHotel.SEMUA;

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

  List<CardHotel> getFilteredCardHotels() {
    switch (_currentTab) {
      case TabStatusHotel.MENUNGGU:
        return CardHotel.cardHotel
            .where((card) => card.title == 'MENUNGGU PEMBAYARAN - 38:24')
            .toList();
      case TabStatusHotel.AKTIF:
        return CardHotel.cardHotel
            .where((card) => card.title == 'SUDAH DIBAYAR')
            .toList();
      case TabStatusHotel.SELESAI:
        return CardHotel.cardHotel
            .where((card) => card.title == 'PESANAN SELESAI')
            .toList();
      case TabStatusHotel.DIBATALKAN:
        return CardHotel.cardHotel
            .where((card) => card.title == 'PESANAN DIBATALKAN')
            .toList();
      case TabStatusHotel.PENGEMBALIAN:
        return CardHotel.cardHotel
            .where((card) => card.title == 'DALAM PROSES PENGEMBALIAN')
            .toList();
      case TabStatusHotel.SEMUA:
      default:
        return CardHotel.cardHotel;
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

  void navigateToDetailPage(CardHotel card) {
    Widget destinationPage;

    switch (card.title) {
      case 'MENUNGGU PEMBAYARAN - 38:24':
        destinationPage = const OrderPending();
        break;
      case 'SUDAH DIBAYAR':
        destinationPage = const OrderActive();
        break;
      case 'PESANAN SELESAI':
        destinationPage = const OrderSucces();
        break;
      case 'PESANAN DIBATALKAN':
        destinationPage = const OrderCanccel();
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
    tabProvider.setActiveTabIndex(0);

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
                        borderWidth: .3.w,
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
                            _currentTab = TabStatusHotel.values[index];
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
                itemCount: getFilteredCardHotels().length,
                itemBuilder: (context, index) {
                  final cardHotel = getFilteredCardHotels()[index];
                  return InkWell(
                    onTap: () {
                      navigateToDetailPage(cardHotel);
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
                                      cardHotel.icon!,
                                      SizedBox(width: 5.w),
                                      Text(
                                        cardHotel.title!,
                                        style: myTextTheme.titleLarge?.copyWith(
                                          color: getIconColor(cardHotel.icon!),
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
                                          child:
                                              CardHotel.cardHotel[index].image,
                                        ),
                                      ),
                                      SizedBox(width: 20.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cardHotel.name!,
                                              style: myTextTheme.displayMedium,
                                            ),
                                            SizedBox(height: 10.h),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    cardHotel.location!,
                                                    SizedBox(width: 10.w),
                                                    Expanded(
                                                      child: Text(
                                                        cardHotel.nameLocation!,
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
                                                    cardHotel.bed!,
                                                    SizedBox(width: 10.w),
                                                    Expanded(
                                                      child: Text(
                                                        cardHotel.nameBed!,
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
                                                    cardHotel.bedTime!,
                                                    SizedBox(width: 10.w),
                                                    Expanded(
                                                      child: Text(
                                                        cardHotel.nameBedTime!,
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
                                                    cardHotel.dateTime!,
                                                    SizedBox(width: 10.w),
                                                    Expanded(
                                                      child: Text(
                                                        cardHotel.nameDateTime!,
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
                                          cardHotel.noPesanan!,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
