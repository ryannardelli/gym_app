import 'package:flutter/material.dart';
import 'package:flutter_gym_app/models/exercise_model.dart';
import 'package:flutter_gym_app/models/feeling_model.dart';
import 'package:flutter_gym_app/app_colors.dart';
import 'package:flutter_gym_app/screens/screen_register_training.dart';

class ScreenTraining extends StatelessWidget {
  ScreenTraining({super.key});

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenRegisterTraining()),
          );
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
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Botão Enviar foto
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      elevation: 6,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file, size: 28),
                    label: const Text(
                      "Enviar Foto",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Botão Tirar foto
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      elevation: 6,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt, size: 28),
                    label: const Text(
                      "Tirar Foto",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(exerciseModel.howMake),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: AppColors.secondary),
            ),
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
