import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_colors.dart';
import 'package:flutter_gym_app/components/decoration_field_auth.dart';
import 'package:flutter_gym_app/screens/screen_home.dart';

class ScreenAuthentication extends StatefulWidget {
  const ScreenAuthentication({super.key});

  @override
  State<ScreenAuthentication> createState() => _ScreenAuthenticationState();
}

class _ScreenAuthenticationState extends State<ScreenAuthentication> {
  bool isAuth = true;
  final _formKey = GlobalKey<FormState>();

  // Controllers para pegar os valores
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 50),
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
                      controller: emailController,
                      decoration: getAuthInputDecoration("E-mail:"),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "O e-mail não pode ficar vazio.";
                        }
                        if (value.length < 5) {
                          return "O e-mail é muito curto.";
                        }
                        if (!value.contains("@")) {
                          return "O e-mail não é válido.";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Campo senha
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: getAuthInputDecoration("Senha:"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "A senha não pode ficar vazia.";
                        }
                        if (value.length < 6) {
                          return "A senha deve ter ao menos 6 caracteres.";
                        }
                        return null;
                      },
                    ),

                    // Campos extras para cadastro
                    Visibility(
                      visible: !isAuth,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: getAuthInputDecoration(
                              "Confirme a senha:",
                            ),
                            validator: (value) {
                              if (!isAuth) {
                                if (value == null || value.isEmpty) {
                                  return "A confirmação de senha não pode ficar vazia.";
                                }
                                if (value != passwordController.text) {
                                  return "As senhas não conferem.";
                                }
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Botão principal (entrar/cadastrar)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: handleMainButton,
                      child: Text(isAuth ? "Entrar" : "Cadastrar"),
                    ),

                    const Divider(color: Colors.white70),

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
          ),
        ],
      ),
    );
  }

  // Função que valida o formulário
  // void handleMainButton() {
  //   if (_formKey.currentState!.validate()) {
  //     print("Formulário válido.");
  //     // Aqui você coloca a lógica de login ou cadastro
  //   } else {
  //     print("Formulário inválido.");
  //   }
  // }

  void handleMainButton() {
    if (_formKey.currentState!.validate()) {
      print("Formulário válido.");

      // MOCK: aceitar qualquer email e senha
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScreenHome()),
      );
    } else {
      print("Formulário inválido.");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
