import 'package:dio/dio.dart';

class HotelOrderDetailApi {
  Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket/detail';

  Future<dynamic> fetchOrderTrainTicketDetail(
      int ticketOrderId, bool checkIn, bool checkOut) async {
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODc0OTE4ODQsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.42HfICCGWUvz1PK6cYGOhl05wv2N_a4QGw7hHwKDc0M'
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