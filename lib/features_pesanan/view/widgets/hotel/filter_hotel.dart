import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/hotel/card/card_return_canceled.dart';
import 'package:capstone_project_tripease/features_pesanan/view/widgets/hotel/card/card_return_finish.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/icons.dart';
import '../../../utils/images.dart';
import '../../../view_model/provider/data_provider.dart';
import 'card/card_active.dart';
import 'card/card_canceled.dart';
import 'card/card_finished.dart';
import 'card/card_return_proses.dart';
import 'card/card_wait.dart';

class FilterHotel extends StatelessWidget {
  const FilterHotel({
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
                          CardActiveHotel(
                            icon: iconCheck,
                            title: 'SUDAH BAYAR',
                            name: 'Shibuya Shabu',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Bangkok - Thailand',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardCanceledHotel(
                            icon: iconCencel,
                            title: 'PESANAN DIBATALKAN',
                            name: 'Everyday',
                            image: everyday,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Soekarno Hatta, Malang',
                            iconBed: iconBed,
                            titleBed: 'Standard Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '2 Night',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                          CardReturnFinishHotel(
                            icon: iconCheck,
                            title: 'BERHASIL DIKEMBALIKAN',
                            name: 'Shangri-La',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Mayjend Sungkono, Surabaya',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardWaitHotel(
                            icon: iconSchedule,
                            title: 'MENUNGGU PEMBAYARAN - ',
                            time: '38:24',
                            name: 'Everyday',
                            image: everyday,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Soekarno Hatta, Malang',
                            iconBed: iconBed,
                            titleBed: 'Standard Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '2 Night',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardActiveHotel(
                            icon: iconCheck,
                            title: 'Sudah Bayar',
                            name: 'Shibuya Shabu',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Bangkok - Thailand',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardFinishedHotel(
                            icon: iconPesananSelesai,
                            title: 'PESANAN SELESAI',
                            name: 'Shibuya Shabu',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Bangkok - Thailand',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardCanceledHotel(
                            icon: iconCencel,
                            title: 'PESANAN DIBATALKAN',
                            name: 'Everyday',
                            image: everyday,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Soekarno Hatta, Malang',
                            iconBed: iconBed,
                            titleBed: 'Standard Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '2 Night',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '53243434',
                          ),
                          CardCanceledHotel(
                            icon: iconCencel,
                            title: 'MELEWATI BATAS WAKTU PEMBAYARAN',
                            name: 'Shangri-La',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Mayjend Sungkono, Surabaya',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          CardReturnProsesHotel(
                            icon: iconSchedule,
                            title: 'DALAM PROSES PENGEMBALIAN',
                            name: 'Everyday',
                            image: everyday,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Soekarno Hatta, Malang',
                            iconBed: iconBed,
                            titleBed: 'Standard Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '2 Night',
                            iconDate: iconDate,
                            titleDate: '05 Mei 2023 - 07 Mei 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardReturnFinishHotel(
                            icon: iconCheck,
                            title: 'BERHASIL DIKEMBALIKAN',
                            name: 'Shangri-La',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Jl. Mayjend Sungkono, Surabaya',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
                          ),
                          CardReturnCanceledHotel(
                            icon: iconCencel,
                            title: 'GAGAL DIKEMBALIKAN',
                            name: 'Shibuya Shabu',
                            image: shibuya,
                            iconLocation: iconLocation,
                            titleLocation: 'Bangkok - Thailand',
                            iconBed: iconBed,
                            titleBed: 'Exclusive Room',
                            iconBedTime: iconBedTime,
                            titleBedTime: '1 Night',
                            iconDate: iconDate,
                            titleDate: '26 April 2023 - 22 April 2023',
                            nomorPesanan: '60985827',
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
