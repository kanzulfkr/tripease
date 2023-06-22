import 'package:capstone_project_tripease/features_order/apis/hotel/hotel_order_api.dart';
import 'package:flutter/foundation.dart';

import '../../../model/hotel/hotel_order_model.dart';

enum TabStatusHotel {
  SEMUA,
  MENUNGGU,
  AKTIF,
  SELESAI,
  DIBATALKAN,
  PENGEMBALIAN
}

class HotelOrderProvider with ChangeNotifier {
  List<Datum> _hotelOrder = [];
  List<Datum> get hotelOrder => _hotelOrder;

  TabStatusHotel _tabStatusHotel = TabStatusHotel.SEMUA;
  TabStatusHotel get tabStatusHotel => _tabStatusHotel;

  Future<void> fetchHotelOrder({
    int? pageNumber,
    int? limit,
    String? search,
    String? nameHotel,
    String? addressHotel,
    String? orderDateHotel,
    String? orderBy,
    String? status,
  }) async {
    try {
      final response = await HotelOrderApi().fetchHotelOrder(
        pageNumber: pageNumber,
        limit: limit,
        search: search,
        nameHotel: nameHotel,
        addressHotel: addressHotel,
        orderDateHotel: orderDateHotel,
        orderBy: orderBy,
        status: status,
      );
      _hotelOrder = response.data!;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void changesTab(TabStatusHotel tabStatusHotel) {
    _tabStatusHotel = tabStatusHotel;
    notifyListeners();
  }
}
