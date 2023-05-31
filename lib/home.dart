import 'package:flutter/material.dart';

import 'features_pesanan/view/screens/beranda_screen.dart';
import 'features_pesanan/view/screens/pesanan_screen.dart';
import 'features_pesanan/view/screens/profile_screen.dart';
import 'features_pesanan/view/widgets/bottom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List _screens = [
    const BerandaScreen(),
    const PesananScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
