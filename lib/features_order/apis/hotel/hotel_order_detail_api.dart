import 'package:dio/dio.dart';

import '../../../features_onboard/utils/token_manager.dart';

class HotelOrderDetailApi {
  Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket/detail';

  Future<dynamic> fetchOrderTrainTicketDetail(
      int? ticketOrderId, bool? checkIn, bool? checkOut) async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
        }),
        queryParameters: {
          'ticket_order_id': ticketOrderId,
          'update_chcek_in': checkIn,
          'update_chcek_out': checkOut,
        });
    if (response.statusCode == 200) {
      // print('TrainOrder Detail : ${response.data}');
      return response;
    } else {
      throw Exception('Error get data');
    }
  }
}
