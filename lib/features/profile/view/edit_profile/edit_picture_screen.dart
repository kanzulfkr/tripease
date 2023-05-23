import 'package:capstone_project_tripease/features/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features/profile/view/component/button_inactive.dart';
import 'package:capstone_project_tripease/features/profile/view/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class EditPictureScreen extends StatefulWidget {
  const EditPictureScreen({super.key, required this.title});
  final String title;
  @override
  State<EditPictureScreen> createState() => _EditPictureScreenState();
}

class _EditPictureScreenState extends State<EditPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/user.jfif'),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: ButtonInactive(
                    text: 'Batal',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ButtonActive(
                    text: 'Selesai',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(
                          title: 'Ubah Profile',
                        ),
                      ));
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
