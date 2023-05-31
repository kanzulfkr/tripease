import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_active.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_finished.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_return_pending.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_return_success.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/card/card_wait.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/icons.dart';
import '../../../utils/images.dart';
import 'card/card_canceled.dart';
import 'card/card_canceled_no_payment.dart';
import 'card/card_return_failed.dart';

class FilterKeretaApi extends StatelessWidget {
  const FilterKeretaApi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, tabProvider, _) {
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
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ButtonsTabBar(
                            radius: 50.0,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
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
                      ListView(
                        children: [
                          CardFinishKA(
                            icon: iconPesananSelesai,
                            title: 'PESANAN SELESAI',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardActiveKA(
                            icon: iconCheck,
                            title: 'SUDAH DIBAYAR',
                            nameStart: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(E)',
                            iconDate: iconDate,
                            titleDate: '29 April 2023 - 29 April 2023',
                            nomorPesanan: '2041720011',
                          ),
                          CardWaitKA(
                            icon: iconSchedule,
                            title: 'MENUNGGU PEMBAYARAN - ',
                            time: '42:25',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta2,
                            iconLocation: iconTrain,
                            titleLocation: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                          CardReturnKASuccess(
                            icon: iconSchedule,
                            title: 'DALAMA PROSES PENGEMBALIAN',
                            nameStart: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta2,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeat: 'Eksekutif(E)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardActiveKA(
                            icon: iconCheck,
                            title: 'BERHASIL DIKEMBALIKAN',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardCanceledKA(
                            icon: iconCencel,
                            title: 'GAGAL DIKEMBALIKAN',
                            nameStrat: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeats: 'Eksekutif(e)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardWaitKA(
                            icon: iconSchedule,
                            title: 'MENUNGGU PEMBAYARAN - ',
                            time: '42:25',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta2,
                            iconLocation: iconTrain,
                            titleLocation: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardActiveKA(
                            icon: iconCheck,
                            title: 'SUDAH DIBAYAR',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardFinishKA(
                            icon: iconPesananSelesai,
                            title: 'PESANAN SELESAI',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardCanceledKA(
                            icon: iconCencel,
                            title: 'PESANAN DIBATALKAN',
                            nameStrat: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta2,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeats: 'Eksekutif(e)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                          CardCanceledNoPaymentKA(
                            icon: iconCencel,
                            title: 'MELEWATI BATAS WAKTU PEMBAYARAN',
                            nameStrat: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeats: 'Eksekutif(e)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardReturnKAPending(
                            icon: iconSchedule,
                            title: 'DALAMA PROSES PENGEMBALIAN',
                            nameStrat: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta2,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeats: 'Eksekutif(E)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardReturnKASuccess(
                            icon: iconCheck,
                            title: 'BERHASIL DIKEMBALIKAN',
                            nameStart: 'Malang',
                            iconForward: iconForward,
                            nameFinish: 'Sidoarjo',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Jayabaya',
                            iconSeat: iconSeat,
                            titleSeat: 'Ekonomi(P)',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardReturnKAFailed(
                            icon: iconCencel,
                            title: 'GAGAL DIKEMBALIKAN',
                            nameStart: 'Surabaya',
                            iconForward: iconForward,
                            nameFinish: 'Jakarta',
                            image: kereta1,
                            iconTrain: iconTrain,
                            titleTrain: 'Argo Bromo',
                            iconSeat: iconSeat,
                            titleSeat: 'Eksekutif(E)',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
