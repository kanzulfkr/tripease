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
              Room(name: 'Deluxe', price: 'Rp 1.835.000', imageUrls: ['assets/detail_h2.jpeg', 'assets/detail_h3.jpeg'], capacity: '2 Tamu', bedType: '1 Twin', breakfast: 'Sarapan (2 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Deluxe', deskripsi:'Kamar Deluxe Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: 'Rp 183.500', subtotal: 'Rp 2.018.500', total: 'Rp 1.968.500'),
              Room(name: 'Executive', price: 'Rp 2.375.000', imageUrls: ['assets/detail_h3.jpeg', 'assets/detail_h2.jpeg'], capacity: '2 Tamu', bedType: '1 King', breakfast: 'Sarapan (2 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Executive', deskripsi: 'Kamar Executive Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: 'Rp 237.500', subtotal: 'Rp 2.612.500', total: 'Rp 2.562.500'),
              Room(name: 'Suite', price: 'Rp 2.850.000', imageUrls: ['assets/detail_h2.jpeg', 'assets/detail_h2.jpeg'], capacity: '4 Tamu', bedType: '2 Queen', breakfast: 'Sarapan (4 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Suite', deskripsi: 'Kamar Suite Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: '285.000', subtotal: 'Rp 3.135.000', total: 'Rp 3.085.000'),
              Room(name: 'Family', price: 'Rp 3.500.000', imageUrls: ['assets/detail_h3.jpeg', 'assets/detail_h3.jpeg'], capacity: '6 Tamu', bedType: '2 King + 1 Singke', breakfast: 'Sarapan (6 paket)', refund: 'Pengembalian Dana', wifi: 'Wifi Gratis', reSchedule: 'Perubahan Jadwal', noSmoking: 'Dilarang Merokok', navigateUrl: 'Family', deskripsi: 'Kamar Family Room kami menawarkan kenyamanan dan gaya dengan desain modern yang elegan. Dilengkapi dengan tempat tidur Twin, ruangan ini memiliki fasilitas lengkap untuk memastikan pengalaman menginap yang memuaskan', fasilitas: ['AC', 'Minibar', 'Brankas', 'Teko Elektrik', 'Kulkas', 'Sandal', 'Lemari', 'Telepon Hotel', 'Meja Tulis', 'TV Layar Datar', 'Peralatan Mandi', 'Layanan Bintau', 'Pelayanan 24 Jam', 'Shower', 'Handuk'], asuransi: '350.000', subtotal: 'Rp 3.850.000', total: 'Rp 3.800.000'),
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
                        // All the code here can be scrolled
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
