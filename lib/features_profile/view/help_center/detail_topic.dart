import 'package:capstone_project_tripease/features_profile/view/component/bottom_sheet_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailTopic extends StatelessWidget {
  const DetailTopic({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: const Text(
          'Pencarian',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 84,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color.fromRGBO(0, 128, 255, 1),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(right: 16, top: 10, bottom: 10),
                  hintText: 'Ketuk untuk cari',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(150, 152, 156, 1),
                  ),
                  prefix: const SizedBox(width: 12),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(150, 152, 156, 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            color: const Color.fromRGBO(240, 240, 248, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                  child: Text(
                    'Mengkonfirmasi Pesanan Saya',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 20, 35, 20),
                  child: const Text(
                    'Pesanan Anda telah dikonfirmasi ketika Anda menerima e-tiket Anda, yang berisi kode booking dari PT. Kereta Api Indonesia. Anda bisa menemukan e-tiket di email Anda, dan pada Pesanan.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
                  child: Text(
                    'Apakah Artikel ini membantu?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          bottomSheetReviews(context);
                        },
                        child: Container(
                          width: 77,
                          height: 40,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset('assets/svg/smile.svg'),
                              const Text(
                                'Ya',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          bottomSheetReviews(context);
                        },
                        child: Container(
                          width: 77,
                          height: 40,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset('assets/svg/sad.svg'),
                              const Text(
                                'Tidak',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(0, 128, 255, 1)),
                              ),
                            ],
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
    );
  }
}
