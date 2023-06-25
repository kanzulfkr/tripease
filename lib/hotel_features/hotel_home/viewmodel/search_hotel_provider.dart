import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../api/search_hotel.dart';
import '../model/search_hotel.dart';

enum SortingOptions { empty, recommended, asc, desc, rating }

extension SortingOptionExtension on SortingOptions {
  String toStringValue() {
    switch (this) {
      case SortingOptions.empty:
        return '';
      case SortingOptions.recommended:
        return '';
      case SortingOptions.asc:
        return 'asc';
      case SortingOptions.desc:
        return 'desc';
      case SortingOptions.rating:
        return '';

      default:
        return '';
    }
  }
}

class SearchProvider with ChangeNotifier {
  SortingOptions? _selectedSortingOption = SortingOptions.empty;
  SortingOptions? get selectedSortingOption => _selectedSortingOption;
  List<Datum> _hotel = [];
  List<Datum> get hotel => _hotel;

  List<Datum> _hotelFiltered = [];
  List<Datum> get hotelFiltered => _hotelFiltered;

  int ratinglass = 0;
  String? _address;
  String? get address => _address;
  String? _name;
  String? get name => _name;
  String? _sortByPrice;
  String? get sortByPrice => _sortByPrice;
  SfRangeValues values = const SfRangeValues(0, 10000000);
  int? _jumlahDewasa = 0;
  int? get jumlahDewasa => _jumlahDewasa;
  int? _jumlahAnak = 0;
  int? get jumlahAnak => _jumlahAnak;

  final List<String> _selectedFacilities = [];
  List<String> get selectedFacilities => _selectedFacilities;

  bool isHotelSelected = false;
  bool isGuestHouseSelected = false;
  bool isGpSelected = false;
  bool isBayarTempatSelected = false;
  bool isWifiSelected = false;
  bool isLoungeSelected = false;
  bool isKolamRenangSelected = false;
  bool isSarapanSelected = false;

  int? _selectedHotelIndex;
  int? get selectedHotelIndex => _selectedHotelIndex;

  void setSelectedSortingOption(SortingOptions? sortingOption) {
    _selectedSortingOption = sortingOption;
    notifyListeners();
  }

  void setSelectedHotelIndex(int? index) {
    _selectedHotelIndex = index;
    notifyListeners();
  }

  void toggleHotel() {
    isHotelSelected = !isHotelSelected;
    notifyListeners();
  }

  void toggleGuestHouse() {
    isGuestHouseSelected = !isGuestHouseSelected;
    notifyListeners();
  }

  void toggleGp() {
    isGpSelected = !isGpSelected;
    notifyListeners();
  }

  void toggleBayarTempat() {
    isBayarTempatSelected = !isBayarTempatSelected;
    notifyListeners();
  }

  void toggleWifi() {
    isWifiSelected = !isWifiSelected;
    notifyListeners();
  }

  void toggleLounge() {
    isLoungeSelected = !isLoungeSelected;
    notifyListeners();
  }

  void toggleKolamRenang() {
    isKolamRenangSelected = !isKolamRenangSelected;
    notifyListeners();
  }

  void toggleSarapan() {
    isSarapanSelected = !isSarapanSelected;
    notifyListeners();
  }

  void toggleFacility(String facilityName) {
    if (_selectedFacilities.contains(facilityName)) {
      _selectedFacilities.remove(facilityName);
    } else {
      _selectedFacilities.add(facilityName);
    }
    notifyListeners();
  }

  void setJumlahDewasa(int? jumlahDewasa) {
    _jumlahDewasa = jumlahDewasa;
    notifyListeners();
  }

  void setJumlaAnak(int? jumlaAnak) {
    _jumlahAnak = jumlaAnak;
    notifyListeners();
  }

  void setValue(SfRangeValues value) {
    values = value;
    notifyListeners();
  }

  void setRatingClass(int ratingClass) {
    ratinglass = ratingClass;
    notifyListeners();
  }

  void setAddress(String? address) {
    _address = address;
    notifyListeners();
  }

  void clearAddress() {
    _address = null;
    notifyListeners();
  }

  void setName(String? name) {
    _name = name;
    notifyListeners();
  }

  void setSortPrice(String? sortByPrice) {
    _sortByPrice = sortByPrice;
    notifyListeners();
  }

  Future<void> searchHotel({
    int? page,
    int? limit,
    int? minimumPrice,
    int? maximumPrice,
    int? ratingClass,
    String? address,
    String? name,
    String? sortByPrice,
  }) async {
    try {
      final response = await SearchHotelAPI().searchHotel(
        page: page,
        limit: limit,
        minimumPrice: minimumPrice,
        maximumPrice: maximumPrice,
        ratingClass: ratinglass,
        address: address,
        name: name,
        sortByPrice: sortByPrice,
      );
      _hotel = response.data ?? [];
      notifyListeners();
      debugPrint('hotel: ${_hotel[0].hotelImage?[0].imageUrl}');
      filterHotel();
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  void filterHotel() {
    List<Datum> filteredHotels = _hotel.where((hotel) {
      for (String selectedFacility in selectedFacilities) {
        if (!hotel.hotelFacilities!
            .any((facility) => facility.name == selectedFacility)) {
          return false;
        }
      }
      return true;
    }).toList();

    _hotel = filteredHotels;
    _hotelFiltered = filteredHotels;

    notifyListeners();
  }
}
