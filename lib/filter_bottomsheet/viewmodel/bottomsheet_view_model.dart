import 'package:flutter/material.dart';
import '../model/bottomsheet_model.dart';


class FilterSheetViewModel extends ChangeNotifier {
  FilterSheetModel _filterSheetModel;

  FilterSheetViewModel(this._filterSheetModel);

  FilterSheetModel get filterSheetModel => _filterSheetModel;

  void toggleHotelSelected() {
    _filterSheetModel.hotelSelected = !_filterSheetModel.hotelSelected;
    notifyListeners();
  }

  void toggleGuestHouseSelected() {
    _filterSheetModel.guestHouseSelected = !_filterSheetModel.guestHouseSelected;
    notifyListeners();
  }

  void toggleGpSelected() {
    _filterSheetModel.gpSelected = !_filterSheetModel.gpSelected;
    notifyListeners();
  }

  void toggleBayarTempatSelected() {
    _filterSheetModel.bayarTempatSelected = !_filterSheetModel.bayarTempatSelected;
    notifyListeners();
  }

  void toggleWifiSelected() {
    _filterSheetModel.wifiSelected = !_filterSheetModel.wifiSelected;
    notifyListeners();
  }

  void toggleLoungeSelected() {
    _filterSheetModel.loungeSelected = !_filterSheetModel.loungeSelected;
    notifyListeners();
  }

  void toggleKolamRenangSelected() {
    _filterSheetModel.kolamRenangSelected = !_filterSheetModel.kolamRenangSelected;
    notifyListeners();
  }

  void toggleSarapanSelected() {
    _filterSheetModel.sarapanSelected = !_filterSheetModel.sarapanSelected;
    notifyListeners();
  }

  void setRating(double rating) {
    _filterSheetModel.rating = rating;
    notifyListeners();
  }

  void setMinValue(double minValue) {
    _filterSheetModel.minValue = minValue;
    notifyListeners();
  }

  void setMaxValue(double maxValue) {
    _filterSheetModel.maxValue = maxValue;
    notifyListeners();
  }
}
