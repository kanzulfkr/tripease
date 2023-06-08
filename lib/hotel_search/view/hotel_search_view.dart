import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/hotel_search_view_model.dart';

class HotelSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotelSearchViewModel>(
      create: (_) => HotelSearchViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                SearchInput(),
                SizedBox(height: 20),
                SearchResults(),
                SizedBox(height: 20),
                SearchHistory(),
                SizedBox(height: 20),
                PopularCities(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HotelSearchViewModel>(context);
    
    return Container(
      height: 44,
      padding: EdgeInsets.fromLTRB(17, 3, 17, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: viewModel.searchController,
              decoration: InputDecoration(
                hintText: 'Cari kota atau negara',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: viewModel.clearInput,
          ),
        ],
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HotelSearchViewModel>(context);
    
    return Container(
      height: 252,
      child: Column(
        children: [
          Container(
            width: 202,
            height: 196,
            child: Image.asset('assets/images/search1.jpeg'),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              "Tidak ditemukan hasil untuk 'Makau'!",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.025,
                color: Color(0xFFDB2D24),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "Mohon untuk menginput kata kunci berbeda",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.025,
                color: Color(0xFFDB2D24),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HotelSearchViewModel>(context);
    
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Text(
                "History Pencarian",
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.0125,
                  color: Color(0xFF96989C),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Column(
          children: viewModel.history.map((city) {
            return Container(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city.cityName,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.0125,
                            color: Color(0xFF0D0D0D),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Text(
                          city.countryName,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.0125,
                            color: Color(0xFF96989C),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: Image.asset(city.imageUrl),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PopularCities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HotelSearchViewModel>(context);
    
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Text(
                "Kota Terpopuler",
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.0125,
                  color: Color(0xFF96989C),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Column(
          children: viewModel.popularCities.map((city) {
            return Container(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city.cityName,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.0125,
                            color: Color(0xFF0D0D0D),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Text(
                          city.countryName,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.0125,
                            color: Color(0xFF96989C),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: Image.asset(city.imageUrl),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
