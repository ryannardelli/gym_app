import 'package:flutter/material.dart';
import 'package:flutter_gym_app/models/exercise_model.dart';
import 'package:flutter_gym_app/models/feeling_model.dart';

import 'package:flutter_gym_app/app_colors.dart';

class ScreeTraining extends StatelessWidget {
  ScreeTraining({super.key});

  final exerciseModel = ExerciseModel(
    id: "EX001",
    name: "Remada baixa supinada",
    training: "Treino A",
    howMake: "Segura a barra e puxa",
  );

  final List<FeelingModel> listFeeling = [
    FeelingModel(
      id: "SE001",
      feeling: "Pouca ativação hoje",
      date: "2025-09-18",
    ),
    FeelingModel(
      id: "SE002",
      feeling: "Já senti alguma ativação",
      date: "2025-09-19",
    ),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(exerciseModel.training, style: TextStyle(fontSize: 15)),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.assets,
        elevation: 0,
        toolbarHeight: 72,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Foi clicado!");
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Enviar foto"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Tirar foto"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(exerciseModel.howMake),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(color: AppColors.secondary),
            ),
            Text(
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
