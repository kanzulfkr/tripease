import 'dart:io';
import '/features_profile/view/widgets/button_active.dart';
import '/features_profile/view/widgets/button_close.dart';
import '/features_profile/view/widgets/button_inactive.dart';
import '/features_profile/view/widgets/custom_dialog.dart';
import '/features_profile/view_model/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditPhotoScreen extends StatefulWidget {
  const EditPhotoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<EditPhotoScreen> createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  File? _imageFile;
  bool isImageNew = false;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _imageFile = img;
        isImageNew = true;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      Exception(e);
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
  void initState() {
    super.initState();
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
      body: Consumer<UserProfileProvider>(
        builder: (context, value, child) => Padding(
          padding: EdgeInsets.all(20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageFile == null
                    ? value.loading
                        ? SizedBox(
                            height: 250.h,
                            width: 250.w,
                            child: const CircularProgressIndicator())
                        // CircleAvatar(
                        //     radius: 150.r,
                        //     backgroundImage: const NetworkImage(
                        //       'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                        //     ),
                        //   )
                        : CircleAvatar(
                            radius: 150.r,
                            backgroundImage: NetworkImage(
                              value.result!.profilePictureUrl ?? '',
                            ),
                          )
                    : value.loading
                        ? SizedBox(
                            height: 250.h,
                            width: 250.w,
                            child: const CircularProgressIndicator())
                        : CircleAvatar(
                            backgroundImage: FileImage(_imageFile!),
                            radius: 150.r,
                          ),
                !isImageNew
                    ? Container(
                        padding: EdgeInsets.only(top: 90.h),
                        child: Column(
                          children: [
                            ButtonActive(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ButtonActive(
                                              text: 'Ambil Foto',
                                              onTap: () {
                                                _pickImage(
                                                    (ImageSource.camera));
                                              }),
                                          ButtonInactive(
                                            text: 'Unggah dari Galeri',
                                            onTap: () => _pickImage(
                                                (ImageSource.gallery)),
                                          ),
                                          ButtonInactive(
                                            text: 'Hapus Foto',
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return LogoutDialog(
                                                    title:
                                                        'Apakah Anda yakin untuk menghapus foto profil Anda?',
                                                    content:
                                                        'Anda dapat menambahkan foto profil lagi kapan saja. ',
                                                    btnActive: 'Ya, Hapus Foto',
                                                    btnInactive: 'Batal',
                                                    onTapActive: () async {
                                                      await value
                                                          .deleteProfilePicture();
                                                      value.getUserProfile();
                                                      Navigator.of(context)
                                                          .pop();
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
                                              onTap: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                            ButtonInactive(
                              text: 'Tutup',
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 100.h, bottom: 8.h),
                        child: Column(
                          children: [
                            ButtonActive(
                              text: 'Simpan Foto',
                              onTap: () async {
                                await value.updateProfilePicture(
                                    _imageFile!, _imageFile!.path);
                                const snackBar = SnackBar(
                                  content: Center(
                                    child: Text(
                                      'Foto telah diperbarui',
                                    ),
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(61, 175, 29, 1),
                                  showCloseIcon: true,
                                  closeIconColor: Colors.white,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                await value.getUserProfile();
                                setState(() {
                                  isImageNew = false;
                                });
                              },
                            ),
                            SizedBox(height: 10.h),
                            ButtonClose(
                              text: 'Batal',
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
