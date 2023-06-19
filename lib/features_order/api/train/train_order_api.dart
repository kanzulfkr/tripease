import 'package:dio/dio.dart';

import '../../model/train/train_order_model.dart';

class TrainOrderApi {
  final Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket';

  Future<TrainOrderModel> fetchTrainOrder({
    int? pageNumber,
    int? limit,
    String? search,
    String? classTrain,
    String? nameTrain,
    String? orderBy,
    String? status,
  }) async {
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcxODc1NDUsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.fD8tvkLVFZWF5aqY0jU_QofqaHVdBtHMr5rZc1-Nyds'
        }),
        queryParameters: {
          'page': pageNumber,
          'limit': limit,
          'search': search,
          'class': classTrain,
          'name': nameTrain,
          'order_by': orderBy,
          'status': status,
        });
    if (response.statusCode == 200) {
      final data = TrainOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }

  // Future<dynamic> updateTrainOrder(int ticketOrderId, String status) async {
  //   final response = await dio.patch(baseUrl,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization':
  //               'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcxNzM5MjksInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.aOSIHhfKSs9fxf_Mxac62HrewC76MlrtlMLZzzAwTR8'
  //         },
  //       ),
  //       queryParameters: {
  //         'ticket_order_id': ticketOrderId,
  //         'status': status,
  //       });
  //   if (response.statusCode == 200) {
  //     print('Update status ${response.data}');
  //     return response;
  //   } else {
  //     throw Exception('Error patch data');
  //   }
  // }

  Future<void> updateStatus(int ticketOrderId, String status) async {
    try {
      final response = await dio.patch(
        '$baseUrl$ticketOrderId',
        data: {'status': status},
      );

      if (response.statusCode == 200) {
        print('Status berhasil diubah menjadi "$status".');
      } else {
        print('Gagal mengubah status menjadi "$status".');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
  }
}
