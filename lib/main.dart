import 'package:capstone_project_tripease/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          supportedLocales: [
            Locale('id', 'ID'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}

// {
//   "status_code": 200,
//   "message": "Successfully logged in",
//   "data": {
//     "id": 5,
//     "full_name": "Kanzul f",
//     "email": "kanzul@gmail.com",
//     "phone_number": "0811111111111",
//     "gender": null,
//     "birth_date": "",
//     "profile_picture_url": "https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg",
//     "citizen": "Indonesia",
//     "role": "user",
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODUyODkwMTIsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo1fQ.JiVK41dKb6oFD9Pd5LrcJ2CVtEuSkgZLrpmQ-j6UsXE",
//     "created_at": "2023-05-27T15:49:42.259Z",
//     "updated_at": "2023-05-27T15:49:42.259Z"
//   }
// }