import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../api/train/train_order_api.dart';
import '../../../model/train/train_order_model.dart';

enum TabStatusTrain {
  SEMUA,
  MENUNGGU,
  AKTIF,
  SELESAI,
  DIBATALKAN,
  PENGEMBALIAN
}

class TrainOrderProvider with ChangeNotifier {
  List<Datum> _trainOrder = [];
  List<Datum> get trainOrder => _trainOrder;

  TabStatusTrain _tabStatusTrain = TabStatusTrain.SEMUA;
  TabStatusTrain get tabStatusTrain => _tabStatusTrain;

  Future<void> fetchTrainOrder({
    int? pageNumber,
    int? limit,
    String? search,
    String? classTrain,
    String? nameTrain,
    String? orderBy,
    String? status,
    int? selectedIndex,
  }) async {
    try {
      final response = await TrainOrderApi().fetchTrainOrder(
        pageNumber: pageNumber,
        limit: limit,
        classTrain: classTrain,
        nameTrain: nameTrain,
        orderBy: orderBy,
        status: status,
      );
      _trainOrder = response.data!;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void changesTab(TabStatusTrain tabsTrain) {
    _tabStatusTrain = tabsTrain;
    notifyListeners();
  }
}
