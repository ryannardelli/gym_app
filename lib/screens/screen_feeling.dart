import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class FeelingModel {
  final String id;
  final String feeling;
  final String date;

  FeelingModel({required this.id, required this.feeling, required this.date});
}

class ScreenFeelings extends StatefulWidget {
  const ScreenFeelings({super.key});

  @override
  State<ScreenFeelings> createState() => _ScreenFeelingsState();
}

class _ScreenFeelingsState extends State<ScreenFeelings> {
  final List<FeelingModel> listFeelings = [
    FeelingModel(id: "F001", feeling: "Feliz e motivado", date: "2025-09-20"),
    FeelingModel(id: "F002", feeling: "Um pouco cansado", date: "2025-09-19"),
    FeelingModel(id: "F003", feeling: "Desanimado", date: "2025-09-18"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sentimentos"),
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
          // Navega para uma tela de cadastro de sentimento ou exibe um form
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenAddFeeling(
                onAdd: (newFeeling) {
                  setState(() {
                    listFeelings.add(newFeeling);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: listFeelings.isEmpty
            ? const Center(
                child: Text(
                  "Nenhum sentimento registrado",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: listFeelings.length,
                itemBuilder: (context, index) {
                  final feeling = listFeelings[index];
                  return Card(
                    color: AppColors.assets,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        feeling.feeling,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        feeling.date,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            listFeelings.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

// Tela simples para adicionar um sentimento
class ScreenAddFeeling extends StatefulWidget {
  final Function(FeelingModel) onAdd;
  const ScreenAddFeeling({super.key, required this.onAdd});

  @override
  State<ScreenAddFeeling> createState() => _ScreenAddFeelingState();
}

class _ScreenAddFeelingState extends State<ScreenAddFeeling> {
  final TextEditingController feelingController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Sentimento"),
        backgroundColor: AppColors.assets,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: feelingController,
              decoration: const InputDecoration(
                hintText: "Sentimento",
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newFeeling = FeelingModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  feeling: feelingController.text,
                  date: dateController.text,
                );
                widget.onAdd(newFeeling);
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
