import 'dart:io';

import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/widgets/button_close.dart';
import 'package:capstone_project_tripease/features_profile/view/widgets/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/view/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? CircleAvatar(
                      radius: 140.r,
                      backgroundImage: AssetImage('assets/images/user.jfif'),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!),
                      radius: 140.r,
                    ),
              Padding(
                padding: EdgeInsets.only(top: 100.h, bottom: 8.h),
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
                          padding: EdgeInsets.all(20.h),
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
                                width: 200.w,
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
