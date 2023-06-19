import 'package:dio/dio.dart';

import '../../model/train/train_order_detail_model.dart';

class TrainOrderDetailApi {

  Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket/detail';

  Future<dynamic> fetchOrderTrainTicketDetail(
      int ticketOrderId, int trainId) async {
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcxODc1NDUsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.fD8tvkLVFZWF5aqY0jU_QofqaHVdBtHMr5rZc1-Nyds'
        }),
        queryParameters: {
          'ticket_order_id': ticketOrderId,
          'train_id': trainId,
        });
    if (response.statusCode == 200) {
      // print('TrainOrder Detail : ${response.data}');
      return response;
    } else {
      throw Exception('Error get data');
    }
  }

  // Future<TrainOrderDetailModel> fetchOrderTrainTicket() async {
  //   final response = await dio.get(baseUrl,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization':
  //             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcwNjI4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjoyfQ.YkKuho7VG_e1EWw0UWS2D9kbfvYndm52bJ5VF0_t-vI'
  //       }),
  //       queryParameters: {
          // 'ticketOrderId': ticketOrderId,
          // 'trainId': trainId,
  //       });
  //   if (response.statusCode == 200) {
  //     print('Train Order Detail : ${response.data}');
  //     final data = TrainOrderDetailModel.fromJson(response.data);
  //     return data;
  //   } else {
  //     throw Exception('Error get data');
  //   }
  // }

  // Future<TrainOrderDetailModel> fetchOrderTrainTicketDetail(
  //     int ticketOrderId, int trainId) async {
  //   final response = await dio.get('$baseUrl/detail',
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization':
  //             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcwNjI4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjoyfQ.YkKuho7VG_e1EWw0UWS2D9kbfvYndm52bJ5VF0_t-vI'
  //       }),
  //       queryParameters: {
  //         'ticket_order_id': ticketOrderId,
  //         'train_id': trainId,
  //       });
  //   if (response.statusCode == 200) {
  //     print('Train Order Detail : ${response.data}');
  //     final data = TrainOrderDetailModel.fromJson(response.data);
  //     return data;
  //   } else {
  //     throw Exception('Error get data');
  //   }
  // }

  
}
