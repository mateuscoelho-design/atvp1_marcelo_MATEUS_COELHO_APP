import 'package:flutter/material.dart';
import '../../../app/data/user_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // chave do formulário (necessária para validação com TextFormField)
  final _formKey = GlobalKey<FormState>();

  // captura os textos digitados nos campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // função para realizar o login
  void login() {
    // valida todos os campos do formulário antes de continuar
    if (!_formKey.currentState!.validate()) return;

    // chama o método login passando email e senha
    final user = UserStore.login(emailController.text, passwordController.text);

    // se encontrar um perfil válido navega para a tela home
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');

      // se não exibe uma mensagem de erro na parte de baixo
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login inválido')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // barra superior com título centralizado
      appBar: AppBar(title: const Text('Login'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),

                // validação do campo de email
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o email';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),

                // validação do campo de senha
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a senha';
                  }
                  if (value.length < 3) {
                    return 'Senha muito curta';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // botão que executa a função de login
              ElevatedButton(onPressed: login, child: const Text('Entrar')),

              // botão para navegar até a tela de registro
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
