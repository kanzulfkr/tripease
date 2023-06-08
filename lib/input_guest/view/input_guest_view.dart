import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_hotel/view/payment_hotel.dart';

class InputGuestPage extends StatefulWidget {
  final Room room;
  final ListHotel list;

  const InputGuestPage({required this.room, required this.list});

  @override
  _InputGuestPageState createState() => _InputGuestPageState();
}

class _InputGuestPageState extends State<InputGuestPage> {
  String selectedOption = 'Tuan';
  final TextEditingController _textEditingController = TextEditingController();
  int _wordCount = 0;
  int _maxWordCount = 400;
  bool _isConfirmed = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = _textEditingController.text.split(' ').length;
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pesanan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Apakah data yang dimasukkan sudah benar?'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Tidak'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnotherPage(room: widget.room, list: widget.list,),
                  ),
                );
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.list.name,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.025,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              'Kamar ${widget.room.name}',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0.04,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 11,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
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
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.1,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Detail Pemesan',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 0.025,
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('Nama'),
                                            ],
                                          ),
                                          SizedBox(height: 12,),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'Nama Pemesan',
                                                border: InputBorder.none,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('Nomor Telepon'),
                                            ],
                                          ),
                                          SizedBox(height: 12,),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'Nomor telepon (diawali 0)',
                                                border: InputBorder.none,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('Email'),
                                            ],
                                          ),
                                          SizedBox(height: 12,),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'Email Pemesan',
                                                border: InputBorder.none,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 12,),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,  // Grey color inside the container
                                        borderRadius: BorderRadius.circular(10),  // Curved outline border
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.info),
                                                SizedBox(width: 20),
                                                Text(
                                                  'Info',
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    letterSpacing: 0.025,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Data pemesan hanya digunakan untuk mengirim invoice melalui email dan segala hal yang berhubungan dengan transaksi. Privasi data tetap terjaga.',
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    letterSpacing: 0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Add your button's onPressed logic here
                                        },
                                        child: Text('Tambahkan sebagai Penumpang'),
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
                  ),
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.1,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Detail Pelanggan',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 0.025,
                        ),
                      ),
                      children: <Widget>[
                        for (int i = 0; i < 4; i++)
                        Column(
                          children: [
                            SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Text('Pelanggan ${i + 1}'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(16, 10.5, 16, 10.5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: selectedOption,
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      selectedOption = newValue!;
                                                    });
                                                  },
                                                  items: <String>['Tuan', 'Nyonya']
                                                      .map<DropdownMenuItem<String>>((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Nomor Identitas'),
                                                ],
                                              ),
                                              SizedBox(height: 12),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: 'NIK / Paspor',
                                                    border: InputBorder.none,
                                                    contentPadding: const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 15.0,
                                                    ),
                                                  ),
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter.digitsOnly // Allows only numeric input
                                                  ],
                                                  keyboardType: TextInputType.number, // Shows numeric keyboard
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Nama Lengkap'),
                                                ],
                                              ),
                                              SizedBox(height: 12),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: 'Nama Lengkap',
                                                    border: InputBorder.none,
                                                    contentPadding: const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Permintaan Khusus',
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
                    height: 208,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF0080FF),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            onChanged: (value) {
                              _updateWordCount();
                            },
                            decoration: InputDecoration(
                              hintText: 'Silahkan deskripsikan dengan jelas',
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    child: Row(
                      children: [
                        Text('Batas kata: ($_wordCount/$_maxWordCount)'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              _showConfirmationDialog();
                            },
                            child: Text('Konfirmasi'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}