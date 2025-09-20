import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenStats extends StatelessWidget {
  const ScreenStats({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados mockados
    final stats = [
      {
        "title": "Treinos esta semana",
        "value": "5",
        "color": AppColors.primary,
      },
      {
        "title": "Exercícios completados",
        "value": "32",
        "color": AppColors.secondary,
      },
      {"title": "Horas de treino", "value": "8h", "color": Colors.orangeAccent},
      {
        "title": "Calorias gastas",
        "value": "1200 kcal",
        "color": Colors.purpleAccent,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Estatísticas"),
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
        child: ListView(
          children: [
            // Cards de estatísticas
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final stat = stats[index];
                return Container(
                  decoration: BoxDecoration(
                    color: stat['color'] as Color,
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
                      Text(
                        stat['value'].toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        stat['title'].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Gráfico simples com barras (mock)
            const Text(
              "Progresso semanal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(7, (index) {
                double progress =
                    (index + 1) * 10.0; // exemplo de dados mockados
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Text(
                        [
                          "Seg",
                          "Ter",
                          "Qua",
                          "Qui",
                          "Sex",
                          "Sáb",
                          "Dom",
                        ][index],
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: progress, // largura da barra mock
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${progress.toInt()}%",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
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
