import 'package:flutter/material.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../input_guest/view/input_guest_view.dart';
import '../../list_hotel/model/list_hotel_model.dart';

class RoomPage extends StatefulWidget {
  final Room room;
  final ListHotel list;

  const RoomPage({required this.room, required this.list});

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kamar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            Container(
              height: 192,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.room.imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Image.asset(
                      widget.room.imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
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
                              SizedBox(height: 20),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Deskripsi Kamar',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        letterSpacing: 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF0080FF), // #0080FF hex color
                                    width: 2.0, // border width
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // border radius
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.room.deskripsi,
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          letterSpacing: 0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Fasilitas Kamar',
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
                                    Container(
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 3.5,
                                        ),
                                        itemCount: widget.room.fasilitas.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.check_circle_sharp),
                                                SizedBox(width: 6,),
                                                Text(
                                                  widget.room.fasilitas[index],
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    letterSpacing: 0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputGuestPage(room: widget.room, list: widget.list),
                  ),
                );
              },
              child: Text(
                'Pilih',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}