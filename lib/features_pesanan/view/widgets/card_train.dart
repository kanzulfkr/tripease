import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:capstone_project_tripease/features_pesanan/utils/icons.dart';
import 'package:capstone_project_tripease/features_pesanan/utils/images.dart';

class CardTrain {
  SvgPicture icon;
  String title;
  String nameStart;
  Icon forward;
  String nameFinish;
  Image image;
  SvgPicture train;
  String nameTrain;
  SvgPicture seat;
  String nameSeat;
  SvgPicture dateTime;
  String nameDateTime;
  String noPesanan;

  CardTrain({
    required this.icon,
    required this.title,
    required this.nameStart,
    required this.forward,
    required this.nameFinish,
    required this.image,
    required this.train,
    required this.nameTrain,
    required this.seat,
    required this.nameSeat,
    required this.dateTime,
    required this.nameDateTime,
    required this.noPesanan,
  });

  static final List<CardTrain> cardTrain = [
    CardTrain(
      icon: iconCheck,
      title: 'SUDAH BAYAR',
      image: train1,
      nameStart: 'Malang',
      forward: iconForward,
      nameFinish: 'Yogyakarta',
      train: iconTrain,
      nameTrain: 'Jayabaya',
      seat: iconSeat,
      nameSeat: 'Ekonomi(P)',
      dateTime: iconDate,
      nameDateTime: '26 April 2023 - 27 April 2023',
      noPesanan: '12412912859125',
    ),
  ];
}
