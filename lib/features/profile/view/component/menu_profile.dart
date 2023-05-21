import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    super.key,
    required this.iconName,
    required this.name,
    required this.description,
    required this.onTap,
  });
  final IconData iconName;
  final String name;
  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 72,
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
              child: Icon(
                iconName,
                color: const Color.fromRGBO(0, 128, 255, 1),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(150, 152, 156, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color.fromRGBO(150, 152, 156, 1),
            )
          ],
        ),
      ),
    );
  }
}
