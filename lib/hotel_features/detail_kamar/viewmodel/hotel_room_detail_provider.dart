import 'package:flutter/material.dart';

import '../../api/hotel_room_by_id.dart';
import '../model/hotel_room_detail_model.dart';

class DetailHotelRoomProvider with ChangeNotifier {
  Data _detailHotelRoom = Data();
  Data get detailHotelRoom => _detailHotelRoom;

  int? _selectedHotelRoomIndex;
  int? get selectedHotelRoomIndex => _selectedHotelRoomIndex;

  void setSelectedHotelRoomIndex(int? value) {
    _selectedHotelRoomIndex = value;
    notifyListeners();
  }

  Future<void> getDetailHotelRoom(int id) async {
    try {
      final response = await HotelRoomDetailApi().hotelRoomDetail(id);
      _detailHotelRoom = response.data!;
      notifyListeners();
    } catch (e) {
      print('error: ${e}');
    }
  }
}
