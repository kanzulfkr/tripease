import 'package:flutter/material.dart';
import 'package:hotel_1/list_hotel/model/list_hotel_model.dart';
import 'package:provider/provider.dart';
import '../../detail_kamar/view/detail_kamar.dart';
import '../model/detail_hotel_model.dart';
import '../viewmodel/detail_hotel_view_model.dart';

class DetailView extends StatelessWidget {
  final ListHotel list;

  const DetailView({required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Hotel'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<DetailHotelViewModel>(
        create: (_) => DetailHotelViewModel(
          htl: DetailHotel(
            name: list.name,
            location: list.detailedAddress,
            description: 'Hotel ${list.name} adalah hotel bintang lima yang terletak di pusat kota Bandung. Hotel ini menawarkan kamar-kamar yang modern dan elegan dengan fasilitas lengkap seperti TV layar datar, akses Wi-Fi gratis, dan area duduk yang nyaman. Hotel Hilton Bandung merupakan pilihan yang tepat bagi mereka yang mencari penginapan mewah dan nyaman di kota Bandung.',
            amenities: ['Wi-Fi', 'TV Layar Datar', 'Area duduk yang nyaman', 'Kolam Renang', 'Pusat Kebugaran', 'Spa', 'Lounge'],
            reviews: [
              Review(author: 'Andi Sujadrot', rating: '5', date: '3 hari yang lalu', comment: 'Pelayanan sangat ramah, tempat penginapan yang bersih, bagus, dan nyaman'),
              Review(author: 'Susy Simastuti', rating: '5', date: '1 bulan yang lalu', comment: 'Rekomen buat kumpul - kumpul keluarga'),
              Review(author: 'Thomas Mc', rating: '5', date: '3 bulan yang lalu', comment: 'Staffnya sangat ramah, tempat yang nyaman'),
            ],
            policies: [
              Policy(type: '1. Pembatalan', desc: ['Anda dapat memperoleh pengembalian dana penuh jika pembatalan dilakukan sebelum 48 jam sebelum tanggal check-in.', 'Jika Pembatalan dilakukan dalam waktu kurang dari 48 jam sebelum tanggal check-in, biaya pembatalan sebesar 30% dari total harga pesanan akan dikenakan']),
              Policy(type: '2. Perubahan Jadwal', desc: ['Anda dapat memperoleh pengembalian dana penuh jika pembatalan dilakukan sebelum 48 jam sebelum tanggal check-in.', 'Jika Pembatalan dilakukan dalam waktu kurang dari 48 jam sebelum tanggal check-in, biaya pembatalan sebesar 30% dari total harga pesanan akan dikenakan']),
            ],
            rooms: [
              Room(name: 'Deluxe', price: 'Rp 1.835.000', imageUrls: ['assets/images/detail_h2.jpeg', 'assets/images/detail_h3.jpeg'], capacity: '2 Tamu', bedType: '1 Twin', breakfast: 'Sarapan (2 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Deluxe', deskripsi:'Kamar Deluxe Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: 'Rp 183.500', subtotal: 'Rp 1.835.000', total: 'Rp 1.968.500'),
              Room(name: 'Executive', price: 'Rp 2.375.000', imageUrls: ['assets/images/detail_h3.jpeg', 'assets/images/detail_h2.jpeg'], capacity: '2 Tamu', bedType: '1 King', breakfast: 'Sarapan (2 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Executive', deskripsi: 'Kamar Executive Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: 'Rp 237.500', subtotal: 'Rp 2.375.000', total: 'Rp 2.562.500'),
              Room(name: 'Suite', price: 'Rp 2.850.000', imageUrls: ['assets/images/detail_h2.jpeg', 'assets/images/detail_h2.jpeg'], capacity: '4 Tamu', bedType: '2 Queen', breakfast: 'Sarapan (4 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Suite', deskripsi: 'Kamar Suite Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: '285.000', subtotal: 'Rp 2.850.000', total: 'Rp 3.085.000'),
              Room(name: 'Family', price: 'Rp 3.500.000', imageUrls: ['assets/images/detail_h3.jpeg', 'assets/images/detail_h3.jpeg'], capacity: '6 Tamu', bedType: '2 King + 1 Singke', breakfast: 'Sarapan (6 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Family', deskripsi: 'Kamar Family Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: '350.000', subtotal: 'Rp 3.500.000', total: 'Rp 3.800.000'),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Consumer<DetailHotelViewModel>(
            builder: (context, viewModel, _) {
              return Column(
                children: [
                  SizedBox(height: 12),
                  Container(
                    height: 192,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Image.asset(
                            hotelAssetsList[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.grey),
                              bottom: BorderSide(width: 1.0, color: Colors.grey),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        viewModel.htl.name,
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          letterSpacing: 0.025,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, size: 16, color: Colors.yellow),
                                          Icon(Icons.star, size: 16, color: Colors.yellow),
                                          Icon(Icons.star, size: 16, color: Colors.yellow),
                                          Icon(Icons.star, size: 16, color: Colors.yellow),
                                          Icon(Icons.star, size: 16, color: Colors.yellow),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: 4,),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                viewModel.htl.location,
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  letterSpacing: 0.015,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
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
                              'Tentang Hotel',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                letterSpacing: 0.025,
                              ),
                            ),
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Deskripsi Hotel',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            viewModel.htl.description,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 12,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Fasilitas Umum',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.04,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Container(
                                      child: Column(
                                        children: viewModel.htl.amenities.map((amenity) => Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.check_circle),
                                              SizedBox(width: 12,),
                                              Text(
                                                amenity,
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.04,
                                                ),
                                              )
                                            ],
                                          ),
                                        )).toList(),
                                      ),
                                    ),
                                    SizedBox(height: 12,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Komentar',
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.04,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: viewModel.htl.reviews.map((review) => Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              width: 200,
                                              height: 180,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(review.author),
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.star),
                                                              SizedBox(width: 5,),
                                                              Text(review.rating)
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 3,),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(review.date)
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8,),
                                                  Container(
                                                    child: Text(review.comment),
                                                  ),
                                                  SizedBox(height: 8,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        // Blank Space
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                  icon: Icon(
                                                                    Icons.thumb_up,
                                                                    color: viewModel.likeActive ? Colors.blue : null,
                                                                  ),
                                                                  onPressed: viewModel.handleLikePressed,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                  icon: Icon(
                                                                    Icons.thumb_down,
                                                                    color: viewModel.dislikeActive ? Colors.blue : null,
                                                                  ),
                                                                  onPressed: viewModel.handleDislikePressed,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
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
                              'Kebijakan',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                letterSpacing: 0.025,
                              ),
                            ),
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: 
                                          viewModel.htl.policies.map((policy) => Padding(
                                            padding: EdgeInsets.only(right: 0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        policy.type,
                                                        style: TextStyle(
                                                          fontFamily: 'Open Sans',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          letterSpacing: 0.025,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                                                Container(
                                                  padding: EdgeInsets.only(left: 20),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: policy.desc.map((deskripsi) => Padding(
                                                      padding: EdgeInsets.only(right: 0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            deskripsi,
                                                            style: TextStyle(
                                                              fontFamily: 'Open Sans',
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      ),
                                                    )).toList()
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          child: Row(
                            children: [
                              Text('Tipe Kamar',
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
                          // Room List
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: viewModel.htl.rooms.map((room) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RoomPage(room: room, list: list,),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              room.name,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.04,
                                              ),
                                            ),
                                            Text(
                                              '${room.price}/malam',
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
                                            children: room.imageUrls.map((image) => 
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
                                                  Text(room.capacity,
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
                                                  Text(room.bedType,
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
                                                        Text(room.breakfast,
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
                                                        Text(room.refund,
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
                                                        Text(room.wifi,
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
                                                        Text(room.reSchedule,
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
                                                  Text(room.noSmoking,
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
                                      SizedBox(height: 40,)
                                    ],
                                  ),
                                ),
                              )).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
