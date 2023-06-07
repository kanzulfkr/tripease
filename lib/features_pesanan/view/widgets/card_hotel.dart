import 'package:capstone_project_tripease/features_pesanan/utils/icons.dart';
import 'package:capstone_project_tripease/features_pesanan/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHotel {
  SvgPicture icon;
  String title;
  String name;
  Image image;
  SvgPicture location;
  String nameLocation;
  SvgPicture bed;
  String nameBed;
  SvgPicture bedTime;
  String nameBedTime;
  SvgPicture dateTime;
  String nameDateTime;
  String noPesanan;

  CardHotel({
    required this.icon,
    required this.title,
    required this.name,
    required this.image,
    required this.location,
    required this.nameLocation,
    required this.bed,
    required this.nameBed,
    required this.bedTime,
    required this.nameBedTime,
    required this.dateTime,
    required this.nameDateTime,
    required this.noPesanan,
  });

  static final List<CardHotel> cardHotel = [
    CardHotel(
      icon: iconCheck,
      title: 'SUDAH BAYAR',
      image: shibuya,
      name: 'Shibuya Shabu',
      location: iconLocation,
      nameLocation:
          'Bangkok - Thailand ',
      bed: iconBed,
      nameBed: 'Exclusive Room',
      bedTime: iconBedTime,
      nameBedTime: '1 Night',
      dateTime: iconDate,
      nameDateTime: '26 April 2023 - 27 April 2023',
      noPesanan: '8910781295185',
    ),
  ];
}
