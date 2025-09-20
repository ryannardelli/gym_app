import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';
import 'package:flutter_gym_app/screens/screen_edit_profile.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text("Perfil"),
        centerTitle: true,
        backgroundColor: AppColors.assets,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            children: [
              // Foto do usuário
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/avatar_placeholder.png",
                  ), // coloque a foto do usuário
                ),
              ),
              const SizedBox(height: 16),

              // Nome e email
              Center(
                child: Column(
                  children: const [
                    Text(
                      "Ryan Nardelli",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "ryan@email.com",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Estatísticas rápidas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatistic("Treinos", "12"),
                  _buildStatistic("Exercícios", "48"),
                  _buildStatistic("Horas", "15h"),
                ],
              ),

              const SizedBox(height: 24),

              // Botões de ação
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenEditProfile(),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text("Editar Perfil"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  print("Sair");
                },
                icon: const Icon(Icons.logout),
                label: const Text("Sair"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para estatísticas
  Widget _buildStatistic(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
