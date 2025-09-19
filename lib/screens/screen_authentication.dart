// screen_authentication.dart
import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenAuthentication extends StatelessWidget {
  const ScreenAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.assets,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/logo-app.png", height: 250),
          Text(
            "Transforme seu treino, transforme você",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20, // mais discreto
              fontWeight: FontWeight.w500, // médio ou normal
              color: Colors.white70, // ou uma cor levemente mais clara
            ),
          ),
        ],
      ),
    );
  }
}
