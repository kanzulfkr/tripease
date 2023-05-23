import 'package:capstone_project_tripease/features/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features/profile/view/edit_profile/detail_picture_screen.dart';
import 'package:capstone_project_tripease/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> list = <String>[
    'Afghanistan',
    'Brunei Darussalam',
    'Canada',
    'Denmark',
    'Indonesia',
    'Netherlands'
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailPictureScreen(
                        title: 'Ubah Profile',
                      ),
                    ));
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromRGBO(210, 215, 224, 1),
                    child: CircleAvatar(
                      radius: 47,
                      backgroundImage: AssetImage('assets/images/user.jfif'),
                    ),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Sekar Mauliyah',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Center(
              child: Text(
                'sekarm13@gmail.com',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 12),
              child: Text(
                'Nama Lengkap',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: null,
              initialValue: 'Sekar Mauliyah',
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
            const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                'Nomor Telepon',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: null,
              initialValue: '85792057054',
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                prefixText: '+62 | ',
                prefixStyle: const TextStyle(color: Colors.black),
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                'Tanggal Lahir',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: null,
              initialValue: '01 - Agustus 2001',
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                suffixIcon: const Icon(Icons.date_range_rounded),
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
            const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                'Kewarganegaraan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 45,
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 16, right: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border:
                    Border.all(color: const Color.fromRGBO(210, 215, 224, 1)),
              ),
              child: DropdownButton<String>(
                hint: const Text(
                  'Indonesia',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                value: null,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                isExpanded: true,
                underline: const SizedBox(),
                onChanged: (String? value) {},
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            ButtonActive(
              text: 'Simpan',
              onTap: () {
                const snackBar = SnackBar(
                  content: Center(
                    child: Text('Profil telah berhasil di simpan!'),
                  ),
                  backgroundColor: Color.fromRGBO(61, 175, 29, 1),
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
