import '/features_kai/api/patch_order_train_api.dart';
import '/features_kai/model/patch_order_model.dart';
import 'package:flutter/material.dart';

class PatchTrainProvider with ChangeNotifier {
  Data _data = Data();
  Data get data => _data;

  Future<void> patchOrderTrainProvider(int ticketOrderId, String status) async {
    final patchOrderTrainApi = PatchOrderTrainApi();
    try {
      final result = await patchOrderTrainApi.patchOrder(
          ticketOrderId: ticketOrderId, status: status);
      _data = result.data!;
      notifyListeners();
    } catch (e) {
      debugPrint('error : $e');
    }
  }
}
