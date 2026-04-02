import 'package:flutter/material.dart';
import '../../../app/data/user_store.dart';
import '../model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// Controllers para capturar oa dados registrados nos campos
class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // função responsável por realizar o cadastro do usuário e criar um objeto UserModel com os dados informados
  void register() {
    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    // Adiciona o usuário na lista mockada em memória
    UserStore.addUser(user);

    // exibe uma mensagem de sucesso após o cadastro
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cadastro realizado')));

    // retonar para a tela anterior - login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // barra superior com título centralizado
      appBar: AppBar(title: const Text('Cadastro'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Campo de entrada para o nome do usuário
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),

            // Campo de entrada para o email do usuário
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),

            // Campo de entrada para a senha do usuário - texto oculto
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),

            // espaçamento entre os campos
            const SizedBox(height: 20),

            // botão que executa a função de cadastro
            ElevatedButton(onPressed: register, child: const Text('Cadastrar')),
          ],
        ),
      ),
    );
  }
}
