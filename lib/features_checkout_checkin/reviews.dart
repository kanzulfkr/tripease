
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../features_pesanan/view/screens/pesanan_screen.dart';
import 'component/button_active.dart';
import 'component/button_inactive.dart';


class Reviews extends StatefulWidget {
  const Reviews({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool isOne = false;
  bool isTwo = false;
  bool isThree = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 147,
              width: double.maxFinite,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Pesanan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 128, 255, 1),
                    ),
                  ),
                  SizedBox(
                    height: 99,
                    // color: Colors.amber,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          height: 79,
                          width: 79,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            'assets/images/hotel.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Everyday',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 16),
                                SizedBox(width: 8),
                                Text(
                                  'Jl. Soekarno Hatta, Malang',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.bed_outlined, size: 16),
                                SizedBox(width: 8),
                                Text(
                                  'Standard Room',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.bedtime_outlined, size: 16),
                                SizedBox(width: 8),
                                Text(
                                  '2 Night',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.date_range, size: 16),
                                SizedBox(width: 8),
                                Text(
                                  '05 Mei 2023 - 07 Mei 2023',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        glow: false,
                        itemSize: 24,
                        allowHalfRating: false,
                        minRating: 1,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star_outline_rounded,
                          color: Color.fromRGBO(255, 195, 0, 1),
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            isOne = true;
                            if ((isOne && isTwo && isThree) == true) {
                              isActive = true;
                            }
                          });
                        },
                      ),
                      const Text(
                        'Kualitas Produk',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        glow: false,
                        itemSize: 24,
                        allowHalfRating: false,
                        minRating: 1,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star_outline_rounded,
                          color: Color.fromRGBO(255, 195, 0, 1),
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            isTwo = true;
                            if ((isOne && isTwo && isThree) == true) {
                              isActive = true;
                            }
                          });
                        },
                      ),
                      const Text(
                        'Pelayanan Reservasi',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        glow: false,
                        itemSize: 24,
                        allowHalfRating: false,
                        minRating: 1,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star_outline_rounded,
                          color: Color.fromRGBO(255, 195, 0, 1),
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            isThree = true;
                            if ((isOne && isTwo && isThree) == true) {
                              isActive = true;
                            }
                          });
                        },
                      ),
                      const Text(
                        'Kemudahan Aplikasi',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: const Text(
                'Tempatnya bagus, fasilitasnya lengkap, makanannya enak-enak, sangat ramah untuk difabel',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            isActive
                ? ButtonActive(
                    text: 'Beri Nilai',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PesananScreen(),
                      ));
                    },
                  )
                : ButtonInactive(
                    text: 'Beri Nilai',
                    onTap: () {},
                  ),
            const SizedBox(height: 12),
            ButtonInactive(
              text: 'Kembali ke Halaman Pesanan',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
