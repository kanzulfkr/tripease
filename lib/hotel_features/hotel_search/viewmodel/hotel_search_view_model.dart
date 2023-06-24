import 'package:flutter/material.dart';
import '../model/hotel_search_model.dart';

class HotelSearchViewModel extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<HotelSearchModel> searchResults = [];
  
  void clearInput() {
    searchController.clear();
  }

  void performSearch() {
    // Add your search logic here
    // Populate the searchResults list based on the search input
  }

  void loadSearchHistory() {
    searchResults = [
      HotelSearchModel(
        cityName: 'Bandung', 
        countryName: 'Indonesia', 
        imageUrl: 'assets/images/flag1.jpeg')
    ];
    // Add logic to load search history from a data source (e.g., database)
  }

  void loadPopularCities() {
    // Add logic to load popular cities from a data source (e.g., API)
  }

  List<HotelSearchModel> get history {
    return [
      HotelSearchModel(
        cityName: 'Bandung', 
        countryName: 'Indonesia', 
        imageUrl: 'assets/images/flagID.jpeg',
      ),
      HotelSearchModel(
        cityName: 'Kuala Lumpur', 
        countryName: 'Malaysia', 
        imageUrl: 'assets/images/flagMY.jpeg',
      ),
    ];
  }

  List<HotelSearchModel> get popularCities {
    return [
      HotelSearchModel(
        cityName: 'Bangkok', 
        countryName: 'Thailand', 
        imageUrl: 'assets/images/flagTH.jpeg'
      ),
      HotelSearchModel(
        cityName: 'Penang', 
        countryName: 'Malaysia', 
        imageUrl: 'assets/images/flagMY.jpeg'
      ),
      HotelSearchModel(
        cityName: 'Kuala Lumpur', 
        countryName: 'Malaysia', 
        imageUrl: 'assets/images/flagMY.jpeg'
      ),
      HotelSearchModel(
        cityName: 'Medan', 
        countryName: 'Indonesia', 
        imageUrl: 'assets/images/flagID.jpeg'
      ),
      HotelSearchModel(
        cityName: 'Bandung', 
        countryName: 'Indonesia', 
        imageUrl: 'assets/images/flagID.jpeg'
      ),
      HotelSearchModel(
        cityName: 'Serangoon', 
        countryName: 'Singapura', 
        imageUrl: 'assets/images/flagSG.jpeg'
      ),
    ];
  }
}
