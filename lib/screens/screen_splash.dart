import 'package:flutter/material.dart';
import 'package:flutter_gym_app/screens/screen_authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScreenAuthentication()),
      );
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    // removemos o backgroundColor
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD90404), // vermelho intenso
            Color(0xFFFF5E5E), // vermelho mais claro
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/logo-app.png',
          height: 150,
        ),
      ),
    ),
  );
}

}
