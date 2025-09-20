import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenRegisterExercise extends StatelessWidget {
  ScreenRegisterExercise({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController trainingController = TextEditingController();
  final TextEditingController howMakeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cadastrar Exercício"),
        centerTitle: true,
        backgroundColor: AppColors.assets,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nome do exercício",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: trainingController,
              decoration: const InputDecoration(
                labelText: "Treino",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: howMakeController,
              decoration: const InputDecoration(
                labelText: "Como fazer",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Aqui você pode salvar o exercício em sua lista ou backend
                print("Exercício cadastrado: ${nameController.text}");
                Navigator.pop(context); // Volta para a tela anterior
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Exercício cadastrado com sucesso!"),
                  ),
                );
              },
              child: const Text("Salvar", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
