import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:capstone_project_tripease/features_order/utils/icons.dart';
import 'package:capstone_project_tripease/features_order/utils/images.dart';

enum TabStatusTrain {
  SEMUA,
  MENUNGGU,
  AKTIF,
  SELESAI,
  DIBATALKAN,
  PENGEMBALIAN,
}

class CardTrain {
  SvgPicture? icon;
  String? title;
  String? nameStart;
  Icon? forward;
  String? nameFinish;
  Image image;
  SvgPicture? train;
  String? nameTrain;
  SvgPicture? seat;
  String? nameSeat;
  SvgPicture? dateTime;
  String? nameDateTime;
  String? noPesanan;
  int? paymentTime;

  CardTrain({
    this.icon,
    this.title,
    this.nameStart,
    this.forward,
    this.nameFinish,
    required this.image,
    this.train,
    this.nameTrain,
    this.seat,
    this.nameSeat,
    this.dateTime,
    this.nameDateTime,
    this.noPesanan,
    this.paymentTime,
  });

  static final List<CardTrain> cardTrain = [
    CardTrain(
      icon: iconSchedule,
      title: 'MENUNGGU PEMBAYARAN -',
      paymentTime: DateTime.now()
          .add(const Duration(hours: 1))
          .millisecondsSinceEpoch,
      image: train1,
      nameStart: 'Malang',
      forward: iconForward,
      nameFinish: 'Sidoarjo',
      train: iconTrain,
      nameTrain: 'Jayabaya',
      seat: iconSeat,
      nameSeat: 'Ekonomi(P)',
      dateTime: iconDate,
      nameDateTime: '26 April 2023 - 27 April 2023',
      noPesanan: '124129128591',
    ),
    CardTrain(
      icon: iconCheck,
      title: 'SUDAH DIBAYAR',
      image: train2,
      nameStart: 'Surabaya',
      forward: iconForward,
      nameFinish: 'Jakarta',
      train: iconTrain,
      nameTrain: 'Argo Bromo',
      seat: iconSeat,
      nameSeat: 'Eksekutif(E)',
      dateTime: iconDate,
      nameDateTime: '29 April 2023 - 29 April 2023',
      noPesanan: '21407921047',
    ),
    CardTrain(
      icon: iconPesananSelesai,
      title: 'PESANAN SELESAI',
      image: train1,
      nameStart: 'Malang',
      forward: iconForward,
      nameFinish: 'Sidoarjo',
      train: iconTrain,
      nameTrain: 'Jayabaya',
      seat: iconSeat,
      nameSeat: 'Ekonomi(P)',
      dateTime: iconDate,
      nameDateTime: '26 April 2023 - 27 April 2023',
      noPesanan: '12412912859125',
    ),
    CardTrain(
      icon: iconCencel,
      title: 'PESANAN DIBATALKAN',
      image: train2,
      nameStart: 'Surabaya',
      forward: iconForward,
      nameFinish: 'Jakarta',
      train: iconTrain,
      nameTrain: 'Argo Bromo',
      seat: iconSeat,
      nameSeat: 'Eksekutif(E)',
      dateTime: iconDate,
      nameDateTime: '29 April 2023 - 29 April 2023',
      noPesanan: '12412912859125',
    ),
    CardTrain(
      icon: iconSchedule,
      title: 'DALAM PROSES PENGEMBALIAN',
      image: train2,
      nameStart: 'Surabaya',
      forward: iconForward,
      nameFinish: 'Jakarta',
      train: iconTrain,
      nameTrain: 'Argo Bromo',
      seat: iconSeat,
      nameSeat: 'Eksekutif(E)',
      dateTime: iconDate,
      nameDateTime: '29 April 2023 - 29 April 2023',
      noPesanan: '12412912859125',
    ),
  ];
}
