import 'dart:io';

import 'package:capstone_project_tripease/features_profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/component/button_close.dart';
import 'package:capstone_project_tripease/features_profile/view/component/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/view/component/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class DetailPictureScreen extends StatefulWidget {
  const DetailPictureScreen({super.key, required this.title});
  final String title;
  @override
  State<DetailPictureScreen> createState() => _DetailPictureScreenState();
}

class _DetailPictureScreenState extends State<DetailPictureScreen> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

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
              _image == null
                  ? const CircleAvatar(
                      radius: 140,
                      backgroundImage: AssetImage('assets/images/user.jfif'),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!),
                      radius: 140,
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
                                onTap: () => _pickImage((ImageSource.camera)),
                                // onTap: () {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) =>
                                //         const EditPictureScreen(
                                //       title: 'Atur Foto',
                                //     ),
                                //   ));
                                // },
                              ),
                              ButtonInactive(
                                text: 'Unggah dari Galeri',
                                onTap: () => _pickImage((ImageSource.gallery)),
                                // onTap: () {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) =>
                                //         const EditPictureScreen(
                                //       title: 'Atur Foto',
                                //     ),
                                //   ));
                                // },
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
