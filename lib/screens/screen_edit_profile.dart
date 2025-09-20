import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenEditProfile extends StatefulWidget {
  const ScreenEditProfile({super.key});

  @override
  State<ScreenEditProfile> createState() => _ScreenEditProfileState();
}

class _ScreenEditProfileState extends State<ScreenEditProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Perfil atualizado com sucesso!")),
      );
      Navigator.pop(context); // Volta para a tela anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Editar Perfil"),
        centerTitle: true,
        backgroundColor: AppColors.assets,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Nome
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Nome",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O nome não pode ficar vazio.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O email não pode ficar vazio.";
                  }
                  if (!value.contains("@")) {
                    return "Email inválido.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Idade
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Idade",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "A idade não pode ficar vazia.";
                  }
                  if (int.tryParse(value) == null) {
                    return "Idade inválida.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Botão salvar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: saveProfile,
                child: const Text(
                  "Salvar alterações",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
