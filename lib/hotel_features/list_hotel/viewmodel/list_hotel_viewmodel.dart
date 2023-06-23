import 'package:flutter/material.dart';
import '../model/list_hotel_model.dart';


class ListHotelViewModel {
  List<ListHotel> hotels = [];
  String selectedSortingOption = '';

  void loadHotels() {
    // Data simulasi
    hotels = [
      ListHotel(
        name: 'Padma Hotel',
        address: 'Jl. Amal Luhur No. 1 Bandung, Indonesia',
        imageUrl: 'assets/images/hotel3.jpeg',
        price: 2800000,
        discPrice: '-',
        navigateUrl: 'PadmaHotelPage',
        detailedAddress: 'Jl. HOS. Cokroaminoto No. 41-43, Arjuna, Kec. Cicendo, Bandung, Indonesia'
      ),
      ListHotel(
        name: 'Hilton Bandung',
        address: 'Jl. HOS, Cokroaminoto Bandung, Indonesia',
        imageUrl: 'assets/images/hotel3.jpeg',
        price: 2000000,
        discPrice: 1835000,
        navigateUrl: 'DetailView',
        detailedAddress: 'Jl. HOS. Cokroaminoto No. 41-43, Arjuna, Kec. Cicendo, Bandung, Indonesia'
      ),
      ListHotel(
        name: 'GH Universal',
        address: 'Jl. Dr. Setiabudi No. 376 Bandung, Indonesia',
        imageUrl: 'assets/images/hotel3.jpeg',
        price: 1500000,
        discPrice: 1150000,
        navigateUrl: 'GHUniversalPage',
        detailedAddress: 'Jl. HOS. Cokroaminoto No. 41-43, Arjuna, Kec. Cicendo, Bandung, Indonesia'
      ),
      ListHotel(
        name: 'MOXY Bandung',
        address: 'Jl. Ir. H. Juanda No. 69 Bandung, Indonesia',
        imageUrl: 'assets/images/hotel3.jpeg',
        price: 1200000,
        discPrice: 935000,
        navigateUrl: 'MoxyBandungPage',
        detailedAddress: 'Jl. HOS. Cokroaminoto No. 41-43, Arjuna, Kec. Cicendo, Bandung, Indonesia'
      ),
      ListHotel(
        name: 'Savory Homan',
        address: 'Jl. Asia Afrika No. 112 Bandung, Indonesia',
        imageUrl: 'assets/images/hotel3.jpeg',
        price: 550000,
        discPrice: '-',
        navigateUrl: 'SavoryHomanPage',
        detailedAddress: 'Jl. HOS. Cokroaminoto No. 41-43, Arjuna, Kec. Cicendo, Bandung, Indonesia'
      ),
    ];
  }
}

class PopUpViewModel extends ChangeNotifier {
  PopUpModel _model = PopUpModel();

  String get location => _model.location;
  set location(String value) {
    _model.location = value;
    notifyListeners();
  }

  String get date => _model.date;
  set date(String value) {
    _model.date = value;
    notifyListeners();
  }

  int get roomCount => _model.roomCount;
  set roomCount(int value) {
    _model.roomCount = value;
    notifyListeners();
  }

  int get adultCount => _model.adultCount;
  set adultCount(int value) {
    _model.adultCount = value;
    notifyListeners();
  }

  int get childCount => _model.childCount;
  set childCount(int value) {
    _model.childCount = value;
    notifyListeners();
  }
}