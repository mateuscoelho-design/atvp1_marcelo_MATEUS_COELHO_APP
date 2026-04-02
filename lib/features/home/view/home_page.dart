import 'package:flutter/material.dart';
import '../../../app/data/user_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // recupera o usuário logado armazenado no UserStore
  @override
  Widget build(BuildContext context) {
    final user = UserStore.currentUser;

    // Container principal
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 114, 125, 185),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabeçalho com logo + nome do app no topo
              Row(
                children: [
                  // Caixa da logo com as iniciais dew "MGC", de Mateus Graçadio Coelho de novo
                  Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "MGC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // textos do app
                      Text(
                        "App do Mateus",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tela Home",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // conteúdo central da tela
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ícone de perigo larenja
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: 80,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 16),

                  // exibe o conteúdo do centro puxando o nome do usuário cadastrado
                  Text(
                    "Olá ${user?.name ?? ''},\nO App do Mateus ainda está em desenvolvimento :/",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
