import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';


class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: iconBeranda,
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: iconPesanan,
          label: 'Pesanan',
        ),
        BottomNavigationBarItem(
          icon: iconProfile,
          label: 'Profile',
        ),
      ],
      selectedItemColor: mainBlue,
      unselectedItemColor: grey,
    );
  }
}
