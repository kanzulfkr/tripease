import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/train/train_order_api.dart';
import '../../../model/train/train_order_model.dart';

class TrainSearchProvider extends ChangeNotifier {
  final TrainOrderApi _trainOrderApi = TrainOrderApi();
  List<Datum> _trainOrders = [];
  String? _errorMessage;
  bool _isLoading = false;

  List<Datum> get trainOrders => _trainOrders;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchTrainOrdersByClass(String classTrain) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response =
          await _trainOrderApi.fetchTrainOrder(classTrain: classTrain);

      _trainOrders = response.data!;
      _errorMessage = null;
    } catch (error) {
      _errorMessage = error.toString();
      _trainOrders = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
