import 'package:capstone_project_tripease/features_profile/view/component/button_active.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<dynamic> bottomSheetReviews(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        height: 390,
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              color: Color.fromRGBO(150, 152, 156, 1),
              height: 30,
              thickness: 6,
              endIndent: 170,
              indent: 170,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                'Terima kasih atas masukan Anda!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 10,
              thickness: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: SvgPicture.asset('assets/svg/emoji_pray.svg'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Masukan dan saran yang Anda berikan akan membantu pengembangan layanan kami.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonActive(
                text: 'Tutup',
                onTap: () => Navigator.of(context).pop(),
              ),
            )
          ],
        ),
      );
    },
  );
}
