import 'package:flutter/material.dart';
import 'package:flutter_gym_app/models/exercise_model.dart';
import 'package:flutter_gym_app/models/feeling_model.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenExercise extends StatelessWidget {
  ScreenExercise({super.key});

  final exerciseModel = ExerciseModel(
    id: "EX002",
    name: "Supino reto",
    training: "Treino B",
    howMake:
        "Deite no banco, segure a barra e empurre para cima controladamente.",
  );

  final List<FeelingModel> listFeeling = [
    FeelingModel(id: "SE003", feeling: "Pouca força hoje", date: "2025-09-20"),
    FeelingModel(id: "SE004", feeling: "Me senti bem", date: "2025-09-21"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              exerciseModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(exerciseModel.training, style: const TextStyle(fontSize: 15)),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.assets,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Adicionar nova sensação");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            // Imagem / vídeo do exercício
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 64,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Como fazer
            const Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(exerciseModel.howMake),

            const SizedBox(height: 16),
            const Divider(color: AppColors.secondary),

            // Registro de Séries / Repetições / Carga
            const Text(
              "Registro do exercício",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Séries",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Repetições",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Carga (kg)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(color: AppColors.secondary),

            // Como estou me sentindo
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listFeeling.length, (index) {
                FeelingModel now = listFeeling[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(now.feeling),
                  subtitle: Text(now.date),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: AppColors.assets),
                    onPressed: () {
                      print("Apagar ${now.feeling}");
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
