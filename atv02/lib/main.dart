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
                  Aluno(
                      nm_aluno: 'Nome Sobrenome mais um espaco',
                      desc_aluno: 'Lorem ipsum in dolor sit amet',
                      url_ft: 'assets/images/img1.png'),
                  Aluno(
                      nm_aluno: 'Nome Sobrenome',
                      desc_aluno: 'Descricao bla bla bla',
                      url_ft: 'assets/images/img1.png'),
                  Cadastro(),
                ],
              ))),
    );
  }
}
