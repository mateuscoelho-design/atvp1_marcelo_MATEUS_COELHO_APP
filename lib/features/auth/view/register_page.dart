import 'package:flutter/material.dart';
import '../../../app/data/user_store.dart';
import '../model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// Controllers para capturar os dados digitados nos campos
class _RegisterPageState extends State<RegisterPage> {
  // chave do formulário para validação
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // função responsável por realizar o cadastro do usuário
  void register() {
    // valida os campos antes de cadastrar
    if (!_formKey.currentState!.validate()) return;

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

    // retornar para a tela anterior - login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // barra superior com título centralizado
      appBar: AppBar(title: const Text('Cadastro'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              // TextFormField com validação
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu nome';
                  }
                  return null;
                },
              ),

              // validação de email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o email';
                  }
                  if (!value.contains('@')) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),

              // validação de senha
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a senha';
                  }
                  if (value.length < 3) {
                    return 'A senha deve ter pelo menos 3 caracteres';
                  }
                  return null;
                },
              ),

              // espaçamento entre os campos
              const SizedBox(height: 20),

              // botão que executa a função de cadastro
              ElevatedButton(
                onPressed: register,
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
