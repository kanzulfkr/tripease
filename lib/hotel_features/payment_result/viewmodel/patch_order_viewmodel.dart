import 'package:flutter/material.dart';

import '../../api/patch_order_api.dart';
import '../model/patch_order_model.dart';

class PatchOrderProvider with ChangeNotifier {
  Data _data = Data();
  Data get data => _data;
  Future<void> patchOrderHotel(int orderHotelId, String status) async {
    final patchOrderApi = PatchOrderApi();
    try {
      final result =
          await patchOrderApi.patchOrder(hotelId: orderHotelId, status: status);
      _data = result.data!;
      notifyListeners();
    } catch (e) {
      print('error: ${e}');
    }
  }
}
