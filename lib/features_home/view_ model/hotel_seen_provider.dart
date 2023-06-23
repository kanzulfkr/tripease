import 'package:flutter/foundation.dart';
import 'package:hotel_1/features_home/api/hotel_seen_api.dart';
import 'package:hotel_1/features_home/models/hotel_seen_model.dart';

class HotelSeenProvider with ChangeNotifier {
  List<Datum> _hotelSeen = [];
  List<Datum> get hotelSeen => _hotelSeen;

  Future<void> getHotelSeen() async {
    try {
      final result = await HotelSeenApi().getHotelSeen();
      _hotelSeen = result.data ?? [];
      notifyListeners();
    } catch (e) {
      debugPrint('error: $e');
    }
  }
}
