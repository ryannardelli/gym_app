import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Nome do treino",
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: trainingController,
              decoration: const InputDecoration(
                hintText: "Treino",
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: howMakeController,
              decoration: const InputDecoration(
                hintText: "Como fazer",
                fillColor: Colors.white,
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
