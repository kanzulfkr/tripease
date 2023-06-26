import '/hotel_features/hotel_home/view/clone.dart';

import '/features_home/widgets/for_you.dart';
import '/features_home/widgets/you_just_saw.dart';
import '/features_home/widgets/you_just_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/features_kai/view/ka_page/ka_page.dart';
import '/features_kai/view_model/station/station_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool popUpNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Add your notification button action here
              },
            ),
            const SizedBox(
              width: 30.25,
            ),
            IconButton(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              icon: const Icon(Icons.chat),
              onPressed: () {
                // Add your chat button action here
              },
            ),
            const SizedBox(
              width: 18.96,
            ),
          ],
          title: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 19.75),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pencarian',
                  hintStyle: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<StationProvider>(context, listen: false)
                        .setAsalController('');
                    Provider.of<StationProvider>(context, listen: false)
                        .setTujuanController('');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const KaPage();
                      },
                    ));
                  },
                  child: Container(
                    height: 40.h,
                    width: 160.w,
                    padding: const EdgeInsets.symmetric(horizontal: 32.5),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(51, 153, 255, 1),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.train_outlined,
                          color: Colors.black,
                        ),
                        Text(
                          'Kereta Api',
                          style: GoogleFonts.openSans(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HotelHome()));
                  },
                  child: Container(
                    height: 40.h,
                    width: 160.w,
                    padding: const EdgeInsets.symmetric(horizontal: 36.5),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 143, 51, 1),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.apartment_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(width: 59, child: Text('Hotel'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          popUpNotification
              ? Container(
                  height: 79,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 231, 153, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/pop_up_notification.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      SizedBox(
                        width: 236,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Peringatan keamanan hilang, pembaruan pemesanan, dan balasan obrolan.',
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Check notification settings',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(0, 128, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            popUpNotification = !popUpNotification;
                          });
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Color.fromRGBO(113, 114, 117, 1),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 8),
            child: Text(
              'Anda baru saja melihat',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const YouJustSaw(),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 8),
            child: Text(
              'Hotel pilihan untuk anda',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ForYou(),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 8),
            child: Text(
              'Anda baru saja mencari',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const YouJustSearched(),
        ],
      ),
    );
  }
}
