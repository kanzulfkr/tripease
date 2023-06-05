import '/onboard_feature/view/home.dart';
import '/onboard_feature/view/login.dart';
import '/onboard_feature/view/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToPage();
  }

  navigateToPage() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isOnboardingComplete =
        prefs.getBool('isOnboardingComplete') ?? false;

    final bool isLogin = prefs.getBool('isLogin') ?? false;
    if (context.mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => isLogin
                  ? const HomePage()
                  : (isOnboardingComplete
                      ? const LoginPage()
                      : const OnboardPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo.png'),
            Text(
              'Tripease',
              style: GoogleFonts.openSans(
                  fontSize: 24, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
