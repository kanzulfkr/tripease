import 'package:capstone_project_tripease/features/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features/profile/view/component/button_close.dart';
import 'package:capstone_project_tripease/features/profile/view/component/button_inactive.dart';
import 'package:capstone_project_tripease/features/profile/view/component/custom_dialog.dart';
import 'package:capstone_project_tripease/features/profile/view/edit_profile/edit_picture_screen.dart';
import 'package:flutter/material.dart';

class DetailPictureScreen extends StatefulWidget {
  const DetailPictureScreen({super.key, required this.title});
  final String title;
  @override
  State<DetailPictureScreen> createState() => _DetailPictureScreenState();
}

class _DetailPictureScreenState extends State<DetailPictureScreen> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage('assets/images/user.jfif'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 8),
                child: ButtonActive(
                  text: 'Ubah',
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 10,
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => SizedBox(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonActive(
                                text: 'Ambil Foto',
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const EditPictureScreen(
                                      title: 'Atur Foto',
                                    ),
                                  ));
                                },
                              ),
                              ButtonInactive(
                                text: 'Unggah dari Galeri',
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const EditPictureScreen(
                                      title: 'Atur Foto',
                                    ),
                                  ));
                                },
                              ),
                              ButtonInactive(
                                text: 'Hapus Foto',
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDialog(
                                        title:
                                            'Apakah Anda yakin untuk menghapus foto profil Anda?',
                                        content:
                                            'Anda dapat menambahkan foto profil lagi kapan saja. ',
                                        btnActive: 'Ya, Hapus Foto',
                                        btnInactive: 'Batal',
                                        onTapActive: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 200,
                                child: ButtonInactive(
                                  text: 'Tutup',
                                  onTap: () => Navigator.of(context).pop(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ButtonClose(
                text: 'Tutup',
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
