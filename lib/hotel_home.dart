import 'package:flutter/material.dart';

class HotelHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotel',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0.05,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Container(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: const [
                              Text(
                                'Lokasi',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on), 
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Medan',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.my_location), 
                          ],
                        ),
                        SizedBox(height: 26,),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: const [
                                  Text(
                                    'Tanggal',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: '05 April 2023 - 06 April 2023',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_month),
                                        onPressed: () {
                                          // Logic
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 36),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Jumlah Kamar'),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(color: Colors.grey, width: 1.0),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                            hintText: '0', 
                                          ),
                                          controller: TextEditingController(text: '0'), 
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 35),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Dewasa'),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(color: Colors.grey, width: 1.0),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                hintText: '0', 
                                              ),
                                              controller: TextEditingController(text: '0'), 
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 19,),
                                        Text('Anak'),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(color: Colors.grey, width: 1.0),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                hintText: '0', 
                                              ),
                                              controller: TextEditingController(text: '0'), 
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 260,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Logic
                                            },
                                            child: Text('Cari'),
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color(0xFFF0F0F0), 
                                          ),
                                          child: Icon(
                                            Icons.tune,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          'Hotel Populer',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.25,
                          ),
                          textAlign: TextAlign.left, 
                        ),
                        SizedBox(height: 12,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.zero,
                                      ),
                                      border: Border.all(
                                        color: Colors.black, 
                                      ),
                                    ),
                                    child: Image.asset('assets/hotel1.jpeg'),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey, // Specify the border color here
                                        width: 1.0, // Specify the border width here
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'JW Marriot',
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    letterSpacing: 0.25,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on),
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Jl. Putri Hijau No. 10 Medan, Indonesia',
                                                            softWrap: true,
                                                            overflow: TextOverflow.visible,
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
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 12,),
                              Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.zero,
                                      ),
                                      border: Border.all(
                                        color: Colors.black, 
                                      ),
                                    ),
                                    child: Image.asset('assets/hotel2.jpeg'),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey, // Specify the border color here
                                        width: 1.0, // Specify the border width here
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Marina Bay Sands',
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    letterSpacing: 0.25,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on),
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            '10 Bayfrond Axe Singapura',
                                                            softWrap: true,
                                                            overflow: TextOverflow.visible,
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
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 12,),
                              Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.zero,
                                      ),
                                      border: Border.all(
                                        color: Colors.black, 
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // Details Hotel Here
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
