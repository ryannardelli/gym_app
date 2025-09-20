import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';
import 'package:flutter_gym_app/screens/screen_exercise.dart';
import 'package:flutter_gym_app/screens/screen_profile.dart';
import 'package:flutter_gym_app/screens/screen_stats.dart';
import 'package:flutter_gym_app/screens/screen_training.dart'; // Supondo que você já tenha cores definidas

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de seções do app
    final List<Map<String, dynamic>> sections = [
      {
        "title": "Exercicios",
        "icon": Icons.fitness_center,
        "color": Colors.orangeAccent,
        "route": "/exercises",
      },
      {
        "title": "Treinos",
        "icon": Icons.timer,
        "color": Colors.lightGreen,
        "route": "/workouts",
      },
      {
        "title": "Perfil",
        "icon": Icons.person,
        "color": Colors.blueAccent,
        "route": "/profile",
      },
      {
        "title": "Estatisticas",
        "icon": Icons.bar_chart,
        "color": Colors.purpleAccent,
        "route": "/stats",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem-vindo ao PowerGym"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true, // Ocupa apenas o espaço necessário
            physics: const NeverScrollableScrollPhysics(), // Evita scroll
            itemCount: sections.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 cards por linha
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final section = sections[index];
              return GestureDetector(
                onTap: () {
                  switch (section['title']) {
                    case "Treinos":
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreeTraining(),
                        ),
                      );

                    case "Exercicios":
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenExercise(),
                        ),
                      );

                    case "Perfil":
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenProfile(),
                        ),
                      );

                    case "Estatisticas":
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScreenStats()),
                      );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: section['color'],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(section['icon'], size: 48, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        section['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
