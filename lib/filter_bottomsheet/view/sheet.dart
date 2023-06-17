import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../model/bottomsheet_model.dart';
import '../viewmodel/bottomsheet_view_model.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCustomBottomSheet();
  }
}

class MyCustomBottomSheet extends StatefulWidget {
  @override
  _MyCustomBottomSheetState createState() => _MyCustomBottomSheetState();
}

class _MyCustomBottomSheetState extends State<MyCustomBottomSheet> {
  late TextEditingController _minValueController;
  late TextEditingController _maxValueController;
  SfRangeValues _values = SfRangeValues(0, 10000000);
  double _rating = 0;
  bool isHotelSelected = false;
  bool isGuestHouseSelected = false;
  bool isGpSelected = false;
  bool isBayarTempatSelected = false;
  bool isWifiSelected= false;
  bool isLoungeSelected = false;
  bool isKolamRenangSelected = false;
  bool isSarapanSelected = false;
  
  @override
  void initState() {
    super.initState();
    _minValueController = TextEditingController();
    _maxValueController = TextEditingController();
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
            Container(
              child: Column(
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
                    values: _values,
                    onChanged: (SfRangeValues values) {
                      setState(() {
                        _values = values;
                        _minValueController.text = _values.start.toStringAsFixed(0);
                        _maxValueController.text = _values.end.toStringAsFixed(0);
                      });
                    },
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          height: 44,
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
                              final double minValue = double.tryParse(value) ?? 0;
                              setState(() {
                                _values = SfRangeValues(minValue, _values.end);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 125,
                          height: 44,
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
                              final double maxValue = double.tryParse(value) ?? 0;
                              setState(() {
                                _values = SfRangeValues(_values.start, maxValue);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 68,
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
                          fontSize: 12,
                          letterSpacing: 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 40,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: _rating >= _ ? Colors.yellow : Colors.grey, // Use yellow color for selected stars
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tipe Akomodasi'),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isHotelSelected = !isHotelSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isHotelSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isHotelSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Hotel'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isGuestHouseSelected = !isGuestHouseSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isGuestHouseSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isGuestHouseSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Guest House'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Fasilitas'),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isGpSelected = !isGpSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isGpSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isGpSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Gratis Pembatalan'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isBayarTempatSelected = !isBayarTempatSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isBayarTempatSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isBayarTempatSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Bayar di Tempat'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isWifiSelected = !isWifiSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isWifiSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isWifiSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Wi-Fi'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoungeSelected = !isLoungeSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isLoungeSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isLoungeSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Lounge'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isKolamRenangSelected = !isKolamRenangSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isKolamRenangSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isKolamRenangSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Kolam Renang'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSarapanSelected = !isSarapanSelected;
                              });
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isSarapanSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isSarapanSelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Sarapan'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 320,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Function
                },
                child: Text('Terapkan'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

