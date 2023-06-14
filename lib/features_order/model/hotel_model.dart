import 'package:capstone_project_tripease/features_order/utils/icons.dart';
import 'package:capstone_project_tripease/features_order/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

enum TabStatusHotel {
  SEMUA,
  MENUNGGU,
  AKTIF,
  SELESAI,
  DIBATALKAN,
  PENGEMBALIAN,
}

class CardHotel {
  SvgPicture? icon;
  String? title;
  String? name;
  Image image;
  SvgPicture? location;
  String? nameLocation;
  SvgPicture? bed;
  String? nameBed;
  SvgPicture? bedTime;
  String? nameBedTime;
  SvgPicture? dateTime;
  String? nameDateTime;
  String? noPesanan;
  int? paymentTime;

  CardHotel({
    this.icon,
    this.title,
    this.name,
    required this.image,
    this.location,
    this.nameLocation,
    this.bed,
    this.nameBed,
    this.bedTime,
    this.nameBedTime,
    this.dateTime,
    this.nameDateTime,
    this.noPesanan,
    this.paymentTime,
  });

  static final List<CardHotel> cardHotel = [
    CardHotel(
      icon: iconSchedule,
      title: 'MENUNGGU PEMBAYARAN -',
      paymentTime:
          DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch,
      image: everyday,
      name: 'Everyday',
      location: iconLocation,
      nameLocation: 'Jl.Soekarno Hatta, Malang ',
      bed: iconBed,
      nameBed: 'Standard Room',
      bedTime: iconBedTime,
      nameBedTime: '2 Night',
      dateTime: iconDate,
      nameDateTime: '05 Mei 2023 - 07 Mei 2023',
      noPesanan: '2142412849721',
    ),
    CardHotel(
      icon: iconCheck,
      title: 'SUDAH DIBAYAR',
      image: shibuya,
      name: 'Shibuya Shabu',
      location: iconLocation,
      nameLocation: 'Bangkok - Thailand ',
      bed: iconBed,
      nameBed: 'Exclusive Room',
      bedTime: iconBedTime,
      nameBedTime: '1 Night',
      dateTime: iconDate,
      nameDateTime: '26 April 2023 - 27 April 2023',
      noPesanan: '8910781295185',
    ),
    CardHotel(
      icon: iconPesananSelesai,
      title: 'PESANAN SELESAI',
      image: everyday,
      name: 'Everyday',
      location: iconLocation,
      nameLocation: 'Jl.Soekarno Hatta, Malang ',
      bed: iconBed,
      nameBed: 'Standard Room',
      bedTime: iconBedTime,
      nameBedTime: '2 Night',
      dateTime: iconDate,
      nameDateTime: '05 Mei 2023 - 07 Mei 2023',
      noPesanan: '2142412849721',
    ),
    CardHotel(
      icon: iconCencel,
      title: 'PESANAN DIBATALKAN',
      image: everyday,
      name: 'Everyday',
      location: iconLocation,
      nameLocation: 'Jl.Soekarno Hatta, Malang ',
      bed: iconBed,
      nameBed: 'Standard Room',
      bedTime: iconBedTime,
      nameBedTime: '2 Night',
      dateTime: iconDate,
      nameDateTime: '05 Mei 2023 - 07 Mei 2023',
      noPesanan: '2142412849721',
    ),
    CardHotel(
      icon: iconSchedule,
      title: 'DALAM PROSES PENGEMBALIAN',
      image: everyday,
      name: 'Everyday',
      location: iconLocation,
      nameLocation: 'Jl.Soekarno Hatta, Malang ',
      bed: iconBed,
      nameBed: 'Standard Room',
      bedTime: iconBedTime,
      nameBedTime: '2 Night',
      dateTime: iconDate,
      nameDateTime: '05 Mei 2023 - 07 Mei 2023',
      noPesanan: '2142412849721',
    ),
  ];
}
