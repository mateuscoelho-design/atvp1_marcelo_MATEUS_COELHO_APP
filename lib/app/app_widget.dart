// Importação das páginas para reconhecer as rotas
import 'package:flutter/material.dart';
import '../features/splash/view/splash_page.dart';
import '../features/auth/view/login_page.dart';
import '../features/auth/view/register_page.dart';
import '../features/home/view/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // tira aquela marca vermelha no canto superior direito da tela
      // definição de cor padrão do app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 114, 125, 185),
        ),
      ),

      initialRoute:
          '/', // Dessa maneira definimos que a primeira pág será a splash, como solicitado na atv
      routes: {
        '/': (_) => const SplashPage(), // Map das rotas
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
