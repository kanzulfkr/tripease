import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../../hotel_home/viewmodel/list_address_provider.dart';
import '../../hotel_home/viewmodel/search_hotel_provider.dart';
import '../viewmodel/hotel_search_view_model.dart';

class HotelSearchView extends StatefulWidget {
  const HotelSearchView({super.key});

  @override
  State<HotelSearchView> createState() => _HotelSearchViewState();
}

class _HotelSearchViewState extends State<HotelSearchView> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AddressProvider>(context, listen: false).listAddress());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotelSearchViewModel>(
      create: (_) => HotelSearchViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20.sp),
            child: Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
                final result =
                    addressProvider.searchAddress(addressProvider.query);
                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      height: 44,
                      padding: EdgeInsets.fromLTRB(17.sp, 3.sp, 17.sp, 3.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                addressProvider.updateSearchQuery(value);
                              },
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: 'Cari kota atau negara',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                searchController.clear();
                              }),
                        ],
                      ),
                    ),
                    // SearchInput(),
                    SizedBox(height: 20.h),
                    SizedBox(
                        height: 252.h,
                        child: searchController.text == ''
                            ? Column(
                                children: [
                                  SizedBox(
                                    width: 202.w,
                                    height: 196.h,
                                    child: Image.asset(
                                        'assets/images/search1.jpeg'),
                                  ),
                                  SizedBox(height: 12.h),
                                  Center(
                                    child: Text(
                                      "Tidak ditemukan hasil untuk 'Makau'!",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        letterSpacing: 0.025,
                                        color: const Color(0xFFDB2D24),
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
                                        fontSize: 14.sp,
                                        letterSpacing: 0.025,
                                        color: const Color(0xFFDB2D24),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            : Expanded(
                                child: Container(
                                  height: 300,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(top: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(8),
                                      right: Radius.circular(8),
                                    ),
                                    color: const Color(0xF9FAFBFB),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: result.length,
                                    itemBuilder: (context, index) {
                                      final hotel = result[index];
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              final addressHotel =
                                                  Provider.of<SearchProvider>(
                                                      context,
                                                      listen: false);
                                              addressHotel
                                                  .setAddress(hotel.address);
                                              debugPrint(addressHotel.address);
                                              Navigator.pop(context);
                                            },
                                            child: ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          hotel.address
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .openSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.h),
                                                      // Other widgets in the Row
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  // Other widgets in the Column
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 4.h,
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              )),
                    // SearchResults(),
                    SizedBox(height: 20.h),
                    const SearchHistory(),
                    SizedBox(height: 20.h),
                    const PopularCities(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HotelSearchViewModel>(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              "History Pencarian",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                letterSpacing: 0.0125,
                color: const Color(0xFF96989C),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Column(
          children: viewModel.history.map((city) {
            return Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city.cityName,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: 0.0125,
                          color: const Color(0xFF0D0D0D),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        city.countryName,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: 0.0125,
                          color: const Color(0xFF96989C),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
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
  const PopularCities({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HotelSearchViewModel>(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Kota Terpopuler",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                letterSpacing: 0.0125,
                color: const Color(0xFF96989C),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Column(
          children: viewModel.popularCities.map((city) {
            return Container(
              padding: EdgeInsets.fromLTRB(12.sp, 8.sp, 12.sp, 8.sp),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city.cityName,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: 0.0125,
                          color: const Color(0xFF0D0D0D),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        city.countryName,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: 0.0125,
                          color: const Color(0xFF96989C),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
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
