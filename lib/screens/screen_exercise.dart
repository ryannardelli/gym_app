import 'package:flutter/material.dart';

class ScreenExercise extends StatelessWidget {
  const ScreenExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Puxada alta pronada - Treino A")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Foi clicado!");
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Enviar foto")),
            Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Segura com as duas mãos na barra, mantém a coluna reta e puxa.",
            ),
            Divider(),
            Text(
              "Como estou me sentindo?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("Senti bastante ativação hoje!"),
          ],
        ),
      ),
    );
  }
}
