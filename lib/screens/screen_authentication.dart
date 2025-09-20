import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';

class ScreenAuthentication extends StatefulWidget {
  const ScreenAuthentication({super.key});

  @override
  State<ScreenAuthentication> createState() => _ScreenAuthenticationState();
}

class _ScreenAuthenticationState extends State<ScreenAuthentication> {
  bool isAuth = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.assets,
      body: Stack(
        children: [
          // Fundo com gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.assets],
              ),
            ),
          ),

          // Conteúdo principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo
                  Image.asset("assets/logo-app.png", height: 250),

                  // Slogan
                  const Text(
                    "Transforme seu treino, transforme você",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Campo e-mail
                  TextFormField(
                    decoration: InputDecoration(label: Text("E-mail")),
                  ),

                  SizedBox(height: 20),

                  // Campo senha
                  TextFormField(
                    decoration: InputDecoration(label: Text("Senha")),
                    obscureText: true,
                  ),

                  // Campos extras para cadastro
                  Visibility(
                    visible: !isAuth,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Confirme a senha"),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Botão principal (entrar/cadastrar)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (isAuth) {
                        // lógica de login
                      } else {
                        // lógica de cadastro
                      }
                    },
                    child: Text(isAuth ? "Entrar" : "Cadastrar"),
                  ),

                  const Divider(),

                  // Botão de alternância login/cadastro
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isAuth = !isAuth;
                      });
                    },
                    child: Text(
                      isAuth
                          ? "Ainda não tem uma conta? Cadastre-se"
                          : "Já tem uma conta? Entrar",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
