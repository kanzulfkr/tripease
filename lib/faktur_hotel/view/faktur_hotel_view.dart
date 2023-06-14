import 'package:flutter/material.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_hotel/model/payment_page_model.dart';

class FakturHotel extends StatefulWidget {
  final Room room;
  final ListHotel list;
  final PaymentMethod paymentMethod;

  const FakturHotel({Key? key, required this.room, required this.list, required this.paymentMethod}) : super(key: key);

  @override
  State<FakturHotel> createState() => _FakturHotelState();
}

class _FakturHotelState extends State<FakturHotel> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faktur'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'No. 0000-A',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: 0.025,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 219,
                          padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.list.name,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: 0.04,
                                ),
                              ),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.list.address,
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              letterSpacing: 0.015,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7,),
                              Row(
                                children: [
                                  Icon(Icons.star, size: 16, color: Colors.yellow),
                                  Icon(Icons.star, size: 16, color: Colors.yellow),
                                  Icon(Icons.star, size: 16, color: Colors.yellow),
                                  Icon(Icons.star, size: 16, color: Colors.yellow),
                                  Icon(Icons.star, size: 16, color: Colors.yellow),
                                ],
                              ),
                              SizedBox(height: 6,),
                              Text(
                                'Rp ${widget.list.price. toString()}',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  letterSpacing: 0.04,
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                'Rp. ${widget.list.discPrice!. toString()}',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  letterSpacing: 0.04,
                                  color: Colors.orange
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 140,
                          child: Image.asset(widget.list.imageUrl),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  ExpansionTile(
                    title: Text('Tentang Hotel')
                  ),
                  SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF0080FF), // Use the hex color code #0080FF
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.room.name,
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    letterSpacing: 0.04,
                                  ),
                                ),
                                Text(
                                  '${widget.room.price}/Malam',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    letterSpacing: 0.04,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12,),
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: widget.room.imageUrls.map((image) =>
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 110,
                                      height: 59,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 0.1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Image.asset(image),
                                    ),
                                  ),
                                ).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 14,),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 14,),
                                      Text(widget.room.capacity,
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.bed),
                                      SizedBox(width: 14,),
                                      Text(widget.room.bedType,
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.restaurant),
                                            SizedBox(width: 14,),
                                            Text(widget.room.breakfast,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.04,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.credit_card),
                                            SizedBox(width: 14,),
                                            Text(widget.room.refund,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.04,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.wifi),
                                            SizedBox(width: 14,),
                                            Text(widget.room.wifi,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.04,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.event_available),
                                            SizedBox(width: 14,),
                                            Text(widget.room.reSchedule,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.04,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.smoke_free),
                                      SizedBox(width: 14,),
                                      Text(widget.room.noSmoking,
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          letterSpacing: 0.04,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hotel',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                widget.room.price,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 17,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Asuransi',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                widget.room.asuransi,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 17,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kupon',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                '- Rp 50.000',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                  color: Colors.orange
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        DividerTheme(
                          data: DividerThemeData(
                            color: Colors.black,      // Set the color to black
                            thickness: 1.0,           // Increase or decrease the thickness as desired
                          ),
                          child: Divider(),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              ),
                              Text(
                                widget.room.total,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
          child: Container(
            height: 56.0,
            child: ElevatedButton(
              onPressed: () {
                
              },
              child: Text(
                'Cek Pesanan',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}