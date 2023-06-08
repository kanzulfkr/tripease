class FilterSheetModel {
  bool hotelSelected = false;
  bool guestHouseSelected = false;
  bool gpSelected = false;
  bool bayarTempatSelected = false;
  bool wifiSelected = false;
  bool loungeSelected = false;
  bool kolamRenangSelected = false;
  bool sarapanSelected = false;
  double rating = 0.0;
  double minValue;
  double maxValue;

  FilterSheetModel({
    required this.hotelSelected,
    required this.guestHouseSelected,
    required this.gpSelected,
    required this.bayarTempatSelected,
    required this.wifiSelected,
    required this.loungeSelected,
    required this.kolamRenangSelected,
    required this.sarapanSelected,
    required this.rating,
    required this.minValue,
    required this.maxValue,
  });
}

