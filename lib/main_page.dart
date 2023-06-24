import 'package:hotel_1/selected_tab.dart';
import 'package:provider/provider.dart';

import 'features_order/view/screens/pesanan_screen.dart';
import '/features_profile/view/profile_screen.dart';
import '/features_home/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _screens = [
    const HomeScreen(),
    const PesananScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProv = Provider.of<NavBarProvider>(context);
    Widget customNavBar() {
      return BottomNavigationBar(
        currentIndex: bottomNavProv.selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (i) => bottomNavProv.setSelectedIndex(i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cottage),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profil',
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: customNavBar(),
      body: SafeArea(
        child: IndexedStack(
          index: bottomNavProv.selectedIndex,
          children: _screens,
        ),
      ),
    );
  }
}
