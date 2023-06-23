import 'package:flutter/foundation.dart';
import 'package:hotel_1/hotel_features/api/list_address.dart';

import '../../hotel_features/hotel_home/model/list_address.dart';

class HotelRecommendProvider with ChangeNotifier {
  List<Datum> _hotelRecommend = [];
  List<Datum> get hotelRecommend => _hotelRecommend;

  Future<void> getHotelRecommend(bool recommendation) async {
    try {
      final result = await ListAddressAPI().getRecommendation(recommendation);
      _hotelRecommend = result.data ?? [];
      notifyListeners();
    } catch (e) {
      debugPrint('error: $e');
    }
  }
}
