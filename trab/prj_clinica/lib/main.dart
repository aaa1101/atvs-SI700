import 'package:flutter/material.dart';
import 'package:prj_clinica/screens/cadastro.dart';
import 'package:prj_clinica/screens/index.dart';
import 'package:prj_clinica/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IndexPage(),
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const Cadastro(),
      },
    );
  }
}
