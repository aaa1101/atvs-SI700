import 'package:flutter/material.dart';
import 'screens/aluno1.dart';
import 'screens/aluno2.dart';
import 'screens/cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_circle_outlined)),
                Tab(icon: Icon(Icons.account_circle_outlined)),
                Tab(icon: Icon(Icons.app_registration_rounded)),
              ],
            ),
            title: const Center(child: Text("Atividade 02")),
          ),
          body: const TabBarView(children: [
            Aluno1(),
            Aluno2(),
            Cadastro(),
          ]),
        ),
      ),
    );
  }
}
