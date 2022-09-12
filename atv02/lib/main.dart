import 'package:atv02/screens/aluno.dart';
import 'package:atv02/screens/cadastro.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 02',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.account_circle)),
                    Tab(icon: Icon(Icons.account_circle)),
                    Tab(icon: Icon(Icons.app_registration_outlined)),
                  ],
                ),
                title: const Text("Atividade 02"),
              ),
              body: const TabBarView(
                children: [
                  Aluno(),
                  Aluno(),
                  Cadastro(),
                ],
              ))),
    );
  }
}
