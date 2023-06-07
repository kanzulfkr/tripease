import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/card_train.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_active.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_finished.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_return_pending.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_return_success.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_wait.dart';
import 'package:capstone_project_tripease/features_pesanan/view_model/provider/data_provider.dart';
import 'package:capstone_project_tripease/features_rincian_pesanan_ka/view/order_kai_done.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/icons.dart';
import '../../../utils/images.dart';
import 'card/card_canceled.dart';
import 'card/card_canceled_no_payment.dart';
import 'card/card_return_failed.dart';

class KeretaApi extends StatelessWidget {
  const KeretaApi({
    super.key,
  });

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
                        tabs: const [
                          Tab(text: 'Semua'),
                          Tab(text: 'Menunggu'),
                          Tab(text: 'Aktif'),
                          Tab(text: 'Selesai'),
                          Tab(text: 'Dibatalkan'),
                          Tab(text: 'Pengembalian'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: CardTrain.cardTrain.length,
                    itemBuilder: (context, index) {
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
                                          CardTrain.cardTrain[index].icon,
                                          SizedBox(width: 5.w),
                                          Text(
                                            CardTrain.cardTrain[index].title,
                                            style: myTextTheme.titleLarge,
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
                                                      CardTrain.cardTrain[index]
                                                          .nameStart,
                                                      style: myTextTheme
                                                          .displayMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    CardTrain.cardTrain[index]
                                                        .forward,
                                                    Expanded(
                                                      child: Text(
                                                        CardTrain
                                                            .cardTrain[index]
                                                            .nameFinish,
                                                        style: myTextTheme
                                                            .displayMedium,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        CardTrain
                                                            .cardTrain[index]
                                                            .train,
                                                        SizedBox(width: 5.w),
                                                        Expanded(
                                                          child: Text(
                                                            CardTrain
                                                                .cardTrain[
                                                                    index]
                                                                .nameTrain,
                                                            style: myTextTheme
                                                                .headlineSmall,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        CardTrain
                                                            .cardTrain[index]
                                                            .seat,
                                                        SizedBox(width: 5.w),
                                                        Expanded(
                                                          child: Text(
                                                            CardTrain
                                                                .cardTrain[
                                                                    index]
                                                                .nameSeat,
                                                            style: myTextTheme
                                                                .headlineSmall,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        CardTrain
                                                            .cardTrain[index]
                                                            .dateTime,
                                                        SizedBox(width: 5.w),
                                                        Expanded(
                                                          child: Text(
                                                            CardTrain
                                                                .cardTrain[
                                                                    index]
                                                                .nameDateTime,
                                                            style: myTextTheme
                                                                .headlineSmall,
                                                            overflow:
                                                                TextOverflow
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
                                              CardTrain
                                                  .cardTrain[index].noPesanan,
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
                    // children: [
                    // CardFinishKA(
                    //   icon: iconPesananSelesai,
                    //   title: 'PESANAN SELESAI',
                    //   nameStart: 'Malang',
                    //   iconForward: iconForward,
                    //   nameFinish: 'Sidoarjo',
                    //   image: kereta1,
                    //   iconTrain: iconTrain,
                    //   titleTrain: 'Jayabaya',
                    //   iconSeat: iconSeat,
                    //   titleSeat: 'Ekonomi(P)',
                    //   iconDate: iconDate,
                    //   titleDate: '26 April 2023 - 22 April 2023',
                    //   nomorPesanan: '60985827',
                    // ),
                    // CardActiveKA(
                    //   icon: iconCheck,
                    //   title: 'SUDAH DIBAYAR',
                    //   nameStart: 'Surabaya',
                    //   iconForward: iconForward,
                    //   nameFinish: 'Jakarta',
                    //   image: kereta1,
                    //   iconTrain: iconTrain,
                    //   titleTrain: 'Argo Bromo',
                    //   iconSeat: iconSeat,
                    //   titleSeat: 'Ekonomi(E)',
                    //   iconDate: iconDate,
                    //   titleDate: '29 April 2023 - 29 April 2023',
                    //   nomorPesanan: '2041720011',
                    // ),
                    // CardWaitKA(
                    //   icon: iconSchedule,
                    //   title: 'MENUNGGU PEMBAYARAN - ',
                    //   time: '42:25',
                    //   nameStart: 'Malang',
                    //   iconForward: iconForward,
                    //   nameFinish: 'Sidoarjo',
                    //   image: kereta2,
                    //   iconLocation: iconTrain,
                    //   titleLocation: 'Jayabaya',
                    //   iconSeat: iconSeat,
                    //   titleSeat: 'Ekonomi(P)',
                    //   iconDate: iconDate,
                    //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                    //   nomorPesanan: '53243434',
                    // ),
                    // CardReturnKASuccess(
                    //   icon: iconSchedule,
                    //   title: 'DALAMA PROSES PENGEMBALIAN',
                    //   nameStart: 'Surabaya',
                    //   iconForward: iconForward,
                    //   nameFinish: 'Jakarta',
                    //   image: kereta2,
                    //   iconTrain: iconTrain,
                    //   titleTrain: 'Argo Bromo',
                    //   iconSeat: iconSeat,
                    //   titleSeat: 'Eksekutif(E)',
                    //   iconDate: iconDate,
                    //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                    //   nomorPesanan: '60985827',
                    // ),
                    // CardActiveKA(
                    //   icon: iconCheck,
                    //   title: 'BERHASIL DIKEMBALIKAN',
                    //   nameStart: 'Malang',
                    //   iconForward: iconForward,
                    //   nameFinish: 'Sidoarjo',
                    //   image: kereta1,
                    //   iconTrain: iconTrain,
                    //   titleTrain: 'Jayabaya',
                    //   iconSeat: iconSeat,
                    //   titleSeat: 'Ekonomi(P)',
                    //   iconDate: iconDate,
                    //   titleDate: '26 April 2023 - 22 April 2023',
                    //   nomorPesanan: '60985827',
                    // ),
                    // CardCanceledKA(
                    //   icon: iconCencel,
                    //   title: 'GAGAL DIKEMBALIKAN',
                    //   nameStrat: 'Surabaya',
                    //   iconForward: iconForward,
                    //   nameFinish: 'Jakarta',
                    //   image: kereta1,
                    //   iconTrain: iconTrain,
                    //   titleTrain: 'Argo Bromo',
                    //   iconSeat: iconSeat,
                    //   titleSeats: 'Eksekutif(e)',
                    //   iconDate: iconDate,
                    //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                    //   nomorPesanan: '53243434',
                    // ),
                    // ],
                  ),
                  ListView(
                    children: [
                      // CardWaitKA(
                      //   icon: iconSchedule,
                      //   title: 'MENUNGGU PEMBAYARAN - ',
                      //   time: '42:25',
                      //   nameStart: 'Malang',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Sidoarjo',
                      //   image: kereta2,
                      //   iconLocation: iconTrain,
                      //   titleLocation: 'Jayabaya',
                      //   iconSeat: iconSeat,
                      //   titleSeat: 'Ekonomi(P)',
                      //   iconDate: iconDate,
                      //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                      //   nomorPesanan: '53243434',
                      // ),
                    ],
                  ),
                  ListView(
                    children: [
                      // CardActiveKA(
                      //   icon: iconCheck,
                      //   title: 'SUDAH DIBAYAR',
                      //   nameStart: 'Malang',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Sidoarjo',
                      //   image: kereta1,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Jayabaya',
                      //   iconSeat: iconSeat,
                      //   titleSeat: 'Ekonomi(P)',
                      //   iconDate: iconDate,
                      //   titleDate: '26 April 2023 - 22 April 2023',
                      //   nomorPesanan: '60985827',
                      // ),
                    ],
                  ),
                  ListView(
                    children: [
                      // CardFinishKA(
                      //   icon: iconPesananSelesai,
                      //   title: 'PESANAN SELESAI',
                      //   nameStart: 'Malang',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Sidoarjo',
                      //   image: kereta1,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Jayabaya',
                      //   iconSeat: iconSeat,
                      //   titleSeat: 'Ekonomi(P)',
                      //   iconDate: iconDate,
                      //   titleDate: '26 April 2023 - 22 April 2023',
                      //   nomorPesanan: '60985827',
                      // ),
                    ],
                  ),
                  ListView(
                    children: [
                      // CardCanceledKA(
                      //   icon: iconCencel,
                      //   title: 'PESANAN DIBATALKAN',
                      //   nameStrat: 'Surabaya',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Jakarta',
                      //   image: kereta2,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Argo Bromo',
                      //   iconSeat: iconSeat,
                      //   titleSeats: 'Eksekutif(e)',
                      //   iconDate: iconDate,
                      //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                      //   nomorPesanan: '53243434',
                      // ),
                      // CardCanceledNoPaymentKA(
                      //   icon: iconCencel,
                      //   title: 'MELEWATI BATAS WAKTU PEMBAYARAN',
                      //   nameStrat: 'Surabaya',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Jakarta',
                      //   image: kereta1,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Argo Bromo',
                      //   iconSeat: iconSeat,
                      //   titleSeats: 'Eksekutif(e)',
                      //   iconDate: iconDate,
                      //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                      //   nomorPesanan: '53243434',
                      // ),
                    ],
                  ),
                  ListView(
                    children: [
                      // CardReturnKAPending(
                      //   icon: iconSchedule,
                      //   title: 'DALAMA PROSES PENGEMBALIAN',
                      //   nameStrat: 'Surabaya',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Jakarta',
                      //   image: kereta2,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Argo Bromo',
                      //   iconSeat: iconSeat,
                      //   titleSeats: 'Eksekutif(E)',
                      //   iconDate: iconDate,
                      //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                      //   nomorPesanan: '60985827',
                      // ),
                      // CardReturnKASuccess(
                      //   icon: iconCheck,
                      //   title: 'BERHASIL DIKEMBALIKAN',
                      //   nameStart: 'Malang',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Sidoarjo',
                      //   image: kereta1,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Jayabaya',
                      //   iconSeat: iconSeat,
                      //   titleSeat: 'Ekonomi(P)',
                      //   iconDate: iconDate,
                      //   titleDate: '26 April 2023 - 22 April 2023',
                      //   nomorPesanan: '60985827',
                      // ),
                      // CardReturnKAFailed(
                      //   icon: iconCencel,
                      //   title: 'GAGAL DIKEMBALIKAN',
                      //   nameStart: 'Surabaya',
                      //   iconForward: iconForward,
                      //   nameFinish: 'Jakarta',
                      //   image: kereta1,
                      //   iconTrain: iconTrain,
                      //   titleTrain: 'Argo Bromo',
                      //   iconSeat: iconSeat,
                      //   titleSeat: 'Eksekutif(E)',
                      //   iconDate: iconDate,
                      //   titleDate: '05 Mei 2023 - 07 Mei 2023',
                      //   nomorPesanan: '53243434',
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
