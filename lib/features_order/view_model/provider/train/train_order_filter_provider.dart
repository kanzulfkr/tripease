// import 'package:flutter/material.dart';
// import 'package:capstone_project_tripease/features_order/model/train/train_order_model.dart';

// import '../../../apis/train/train_order_filter_api.dart';

// class TrainOrderFilterProvider extends ChangeNotifier {
//   TrainOrderModel? _trainOrderModel;
//   bool _isLoading = false;
//   String? _errorMessage;

//   Future<void> fetchTrainOrdersByClass(String classTrain) async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       final trainOrderFilter = TrainOrderFilter();
//       final trainOrder =
//           await trainOrderFilter.fetchTrainFilterOrder(classTrain: classTrain);

//       _trainOrderModel = trainOrder;
//       _errorMessage = null;
//     } catch (error) {
//       _trainOrderModel = null;
//       _errorMessage = 'Error fetching data';
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }


import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../../../model/train/train_order_model.dart';

class TrainOrderFilterProvider extends ChangeNotifier {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket';

  List<TrainOrderModel> _filteredOrders = [];
  List<TrainOrderModel> get filteredOrders => _filteredOrders;

  Future<void> fetchTrainFilterOrder({String? classTrain}) async {
    try {
      final response = await dio.get(
        baseUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODc0OTE4ODQsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.42HfICCGWUvz1PK6cYGOhl05wv2N_a4QGw7hHwKDc0M'
          },
        ),
        queryParameters: {
          'class': classTrain,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        _filteredOrders =
            data.map((item) => TrainOrderModel.fromJson(item)).toList();
      } else {
        throw Exception('Error fetching filtered train orders');
      }
    } catch (error) {
      throw Exception('Error fetching filtered train orders: $error');
    }

    notifyListeners();
  }
}
