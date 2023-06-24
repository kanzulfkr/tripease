import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_1/hotel_features/list_hotel/view/list_hotel_view.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../hotel_home/viewmodel/search_hotel_provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyCustomBottomSheet();
  }
}

class MyCustomBottomSheet extends StatefulWidget {
  const MyCustomBottomSheet({super.key});

  @override
  MyCustomBottomSheetState createState() => MyCustomBottomSheetState();
}

class MyCustomBottomSheetState extends State<MyCustomBottomSheet> {
  TextEditingController _minValueController = TextEditingController();
  TextEditingController _maxValueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final filterHotel = Provider.of<SearchProvider>(context, listen: false);
    filterHotel.values.start != null
        ? _minValueController.text = filterHotel.values.start.toStringAsFixed(0)
        : _minValueController.text = "0";
    filterHotel.values.end != null
        ? _maxValueController.text = filterHotel.values.end.toStringAsFixed(0)
        : _maxValueController.text = "1000000";
  }

  @override
  void dispose() {
    _minValueController.dispose();
    _maxValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SearchProvider>(
              builder: (context, searchProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rentang Harga",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.04,
                      ),
                    ),
                    SfRangeSlider(
                      min: 0.0,
                      max: 10000000.0,
                      values: searchProvider.values,
                      onChanged: (SfRangeValues values) {
                        final filterHotel =
                            Provider.of<SearchProvider>(context, listen: false);

                        _minValueController.text =
                            searchProvider.values.start.toStringAsFixed(0);
                        _maxValueController.text =
                            searchProvider.values.end.toStringAsFixed(0);

                        searchProvider.setValue(values);
                        debugPrint(searchProvider.values.start);
                        debugPrint(filterHotel.values.end);
                        // setState(() {
                        //   searchProvider.values = values;
                        //   _minValueController.text = searchProvider.values.start.toStringAsFixed(0);
                        //   _maxValueController.text = searchProvider.values.end.toStringAsFixed(0);
                        // });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 125.w,
                            height: 44.h,
                            padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextFormField(
                              controller: _minValueController,
                              onChanged: (value) {
                                final double minValue =
                                    double.tryParse(value) ?? 0;
                                final SfRangeValues newValues = SfRangeValues(
                                    minValue, searchProvider.values.end);
                                searchProvider.setValue(newValues);

                                debugPrint(searchProvider.values.start);
                                debugPrint(searchProvider.values.end);
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            width: 125.w,
                            height: 44.h,
                            padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextFormField(
                              controller: _maxValueController,
                              onChanged: (value) {
                                final double minValue =
                                    double.tryParse(value) ?? 0;
                                final SfRangeValues newValues = SfRangeValues(
                                    searchProvider.values.start, minValue);
                                searchProvider.setValue(newValues);

                                debugPrint(searchProvider.values.start);
                                debugPrint(searchProvider.values.end);
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 68.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          letterSpacing: 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Consumer<SearchProvider>(
                    builder: (context, searchProvider, child) {
                      return RatingBar.builder(
                        initialRating: searchProvider.ratinglass.toDouble(),
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 40,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: searchProvider.ratinglass >= _
                              ? Colors.yellow
                              : Colors
                                  .grey, // Use yellow color for selected stars
                        ),
                        onRatingUpdate: (rating) async {
                          searchProvider.setRatingClass(rating.toInt());
                          await searchProvider.searchHotel(
                              limit: 9999,
                              ratingClass: searchProvider.ratinglass);
                          debugPrint('${searchProvider.ratinglass}');
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Consumer<SearchProvider>(
              builder: (context, searchProviders, child) {
                return IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tipe Akomodasi'),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleHotel();
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.isHotelSelected,
                                  onChanged: (bool? value) {
                                    searchProviders.toggleHotel();
                                  },
                                ),
                                const Text('Hotel'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleGuestHouse();
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.isGuestHouseSelected,
                                  onChanged: (bool? value) {
                                    searchProviders.toggleGuestHouse();
                                  },
                                ),
                                const Text('Guest House'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 60.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Fasilitas'),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleGp();
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.isGpSelected,
                                  onChanged: (bool? value) {
                                    searchProviders.toggleGp();
                                  },
                                ),
                                const Text('Gratis Pembatalan'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleBayarTempat();
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.isBayarTempatSelected,
                                  onChanged: (bool? value) {
                                    searchProviders.toggleBayarTempat();
                                  },
                                ),
                                const Text('Bayar di Tempat'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleFacility('Wifi');
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.selectedFacilities
                                      .contains('Wifi'),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      searchProviders.toggleFacility('Wifi');
                                    }
                                  },
                                ),
                                const Text('Wi-Fi'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleFacility('Room Service');
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.selectedFacilities
                                      .contains('Room Service'),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      searchProviders
                                          .toggleFacility('Room Service');
                                    }
                                  },
                                ),
                                const Text('Lounge'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleFacility('Outdoor pool');
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.selectedFacilities
                                      .contains('Outdoor pool'),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      searchProviders
                                          .toggleFacility('Outdoor pool');
                                    }
                                  },
                                ),
                                const Text('Kolam Renang'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchProviders.toggleFacility('Breakfast');
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: searchProviders.selectedFacilities
                                      .contains('Breakfast'),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      searchProviders
                                          .toggleFacility('Breakfast');
                                    }
                                  },
                                ),
                                const Text('Sarapan'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 320,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  final searchHotel =
                      Provider.of<SearchProvider>(context, listen: false);
                  if (searchHotel.address != null) {
                    await searchHotel.searchHotel(address: searchHotel.address);
                    debugPrint('PAnjang : ${searchHotel.hotelFiltered.length}');
                  } else if (searchHotel.values.start != null &&
                      searchHotel.values.end != null) {
                    await searchHotel.searchHotel(
                        minimumPrice: searchHotel.values.start.truncate(),
                        maximumPrice: searchHotel.values.end.truncate());
                    debugPrint('PAnjang : ${searchHotel.hotelFiltered.length}');
                    // debugPrint(
                    //     'Data harga: ${searchHotel.hotel[0].hotelRoomStart ?? 'No data'}');
                  } else if (searchHotel.ratinglass != 0 &&
                      searchHotel.hotel != null) {
                    await searchHotel.searchHotel(
                        ratingClass: searchHotel.ratinglass);
                    debugPrint('PAnjang rating : ${searchHotel.hotel?.length}');
                  } else if (searchHotel.address != null &&
                      searchHotel.values.start != null &&
                      searchHotel.values.end != null) {
                    await searchHotel.searchHotel(
                      minimumPrice: searchHotel.values.start.truncate(),
                      maximumPrice: searchHotel.values.end.truncate(),
                      address: searchHotel.address,
                    );
                    debugPrint('PAnjang : ${searchHotel.hotelFiltered.length}');
                  } else if (searchHotel.address != null &&
                      searchHotel.values.start != null &&
                      searchHotel.values.end != null &&
                      searchHotel.ratinglass != 0) {
                    await searchHotel.searchHotel(
                        minimumPrice: searchHotel.values.start.truncate(),
                        maximumPrice: searchHotel.values.end.truncate(),
                        ratingClass: searchHotel.ratinglass,
                        address: searchHotel.address);
                    debugPrint('PAnjang : ${searchHotel.hotelFiltered.length}');
                  } else {
                    await searchHotel.searchHotel();
                    debugPrint('PAnjang : ${searchHotel.hotelFiltered.length}');
                  }
                  Navigator.pop(context);
                  // Function
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text('Terapkan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
