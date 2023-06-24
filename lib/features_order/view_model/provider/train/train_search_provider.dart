import 'package:flutter/foundation.dart';
import '/features_order/model/train/train_order_model.dart';

import '../../../apis/train/train_order_search_api.dart';

class TrainSearchProvider with ChangeNotifier {
  final TrainOrderSearch _trainOrderSearch = TrainOrderSearch();
  TrainOrderModel? _trainOrderModel;
  String? searchKeyword;
  bool _isLoading = false;

  TrainOrderModel? get trainOrderModel => _trainOrderModel;
  bool get isLoading => _isLoading;

  Future<void> searchTrainByName(String? keyword) async {
    searchKeyword = keyword;
    _isLoading = true;
    notifyListeners();

    try {
      _trainOrderModel =
          await _trainOrderSearch.fetchTrainOrderSearch(name: keyword);
      _isLoading = false;
    } catch (error) {
      print('Error fetching train order search: $error');
      _isLoading = false;
    }

    notifyListeners();
  }
}
