import '/onboard_feature/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'slide_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  final List _pages = [
    const SlidePage(
      title: "Temukan Destinasi Anda",
      description:
          "Selamat datang! Temukan destinasi impian Anda.Jelajahi dan temukan pengalaman"
          "perjalanan yang luar biasa",
      image: "assets/images/onboard1.png",
    ),
    const SlidePage(
      title: "Pesan Tiket Anda",
      description: "Pesan tiket Anda dengan mudah. Temukan pilihan terbaik"
          "dan nikmati perjalanan yang menyenangkan",
      image: "assets/images/onboard2.png",
    ),
    const SlidePage(
      title: "Jangan Lewatkan Penawarannya",
      description:
          "Banyak penawaran dan kejutan yang menarik yang bisa anda dapatkan",
      image: "assets/images/onboard3.png",
    ),
    const SlidePage(
      title: "Nikmati Liburan Anda",
      description:
          "Menikmati hidup dengan berwisata memang hal yang tidak boleh dilewatkan",
      image: "assets/images/onboard4.png",
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: _onChanged,
              itemBuilder: ((context, index) {
                return _pages[index];
              })),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: (index == _currentPage) ? 15 : 10,
                      width: (index == _currentPage) ? 15 : 10,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (index == _currentPage)
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5)),
                    );
                  })),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 320,
                height: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xEE0080FF))),
                    onPressed: () async {
                      if (_currentPage == _pages.length - 1) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('isOnboardingComplete', true);
                      } else {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuint);
                      }
                    },
                    child: Text(
                      (_currentPage == _pages.length - 1)
                          ? 'Get Started'
                          : 'Berikutnya',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xEEFFFFFF)),
                    )),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
          Positioned(
            top: 30,
            right: 20,
            child: TextButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isOnboardingComplete', true);
                },
                child: Text(
                  'Lewati',
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xEE717275)),
                )),
          ),
        ],
      ),
    );
  }
}
