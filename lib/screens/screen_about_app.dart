import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenAboutApp extends StatelessWidget {
  const ScreenAboutApp({super.key});

  final List<Map<String, String>> teamMembers = const [
    {
      "name": "Ryan Nardelli",
      "course": "Análise e Desenvolvimento de Sistemas",
      "period": "5º Período",
      "role": "Desenvolvedor",
      "contribution": "Responsável pela arquitetura do sistema e desenvolvimento da interface.",
      "description": "Ryan é apaixonado por tecnologia e busca criar soluções inteligentes e intuitivas que otimizem a experiência do usuário.",
      "image": "assets/ryan_profile.jpg"
    },
    {
      "name": "Victor Hugo",
      "course": "Análise e Desenvolvimento de Sistemas",
      "period": "5º Período",
      "role": "UX/UI Designer",
      "contribution": "Responsável pela criação das telas e experiência visual do aplicativo.",
      "description": "Victor se dedica a tornar a interação do usuário mais fluida e acessível, com foco na estética e na usabilidade.",
      "image": "assets/victor_profile.jpg"
    },
    {
      "name": "Gabriel Gois",
      "course": "Análise e Desenvolvimento de Sistemas",
      "period": "5º Período",
      "role": "Documentador do Projeto",
      "contribution": "Responsável pela documentação completa do aplicativo, incluindo descrição técnica e manual do usuário.",
      "description": "Gabriel tem atenção aos detalhes e organização, garantindo que todas as etapas do projeto estejam bem registradas e acessíveis para toda a equipe.",
      "image": "assets/gabriel_profile.jpg"
    },

   {
      "name": "Carlos Eduardo",
      "course": "Análise e Desenvolvimento de Sistemas",
      "period": "5º Período",
      "role": "Analista de Requisitos",
      "contribution": "Responsável por levantar e documentar as necessidades do sistema, ajudando a definir o escopo e as principais funcionalidades do aplicativo.",
      "description": "Carlos se destacou pela capacidade de traduzir as ideias do grupo em requisitos claros e bem estruturados, facilitando o desenvolvimento do projeto.",
      "image": "assets/carlos_profile.jpg"
}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações sobre o PowerGym"),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Sobre o PowerGym",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Este aplicativo foi desenvolvido com o objetivo de auxiliar os usuários em sua jornada de treinos e bem-estar, oferecendo recursos como acompanhamento de exercícios, estatísticas, registro de sentimentos e personalização de perfil.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 24),
          const Text(
            "Equipe de Desenvolvimento",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...teamMembers.map((member) => _buildMemberCard(member)).toList(),
        ],
      ),
    );
  }

  Widget _buildMemberCard(Map<String, String> member) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem representativa
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                member["image"]!,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Informações
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member["name"]!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                  "${member["course"]} • ${member["period"]}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700], // neutro
                  ),
                ),
                   Text(
                    "Função: ${member["role"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary, // destaque menor
                    ),
                  ),
                  Text(
                    "Contribuição: ${member["contribution"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                  member["description"]!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54, // tom mais leve
                    height: 1.5,
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
