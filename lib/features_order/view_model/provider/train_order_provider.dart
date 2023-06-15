import 'package:capstone_project_tripease/features_order/api/train_order_api.dart';
import 'package:flutter/material.dart';

import '../../model/train_model.dart';

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

  Future<void> fetchTrainOrder(
      {int? pageNumber, int? limit, String? status}) async {
    try {
      final response = await TrainOrderApi().fetchTrainOrder(
        pageNumber: pageNumber,
        limit: limit,
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
