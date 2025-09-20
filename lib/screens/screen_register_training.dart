import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenRegisterTraining extends StatelessWidget {
  ScreenRegisterTraining({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController trainingController = TextEditingController();
  final TextEditingController howMakeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Treino"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nome do treino",
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode salvar o exercício (mock)
                print("Treino cadastrado: ${nameController.text}");
                Navigator.pop(context); // Volta para a tela anterior
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Treino cadastrado!")),
                );
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
