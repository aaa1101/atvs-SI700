import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 2,
          title: Center(
            child: SizedBox(
              width: 200,
              child: Image.asset('assets/images.jpeg'),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: btnLogin(context),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: btnCadastro(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnLogin(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: const Size(40, 40),
        fixedSize: const Size(200, 0),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: const Text('Entrar'),
    );
  }

  Widget btnCadastro(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        minimumSize: const Size(40, 40),
        fixedSize: const Size(200, 0),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () {
        Navigator.pushNamed(context, '/cadastro');
      },
      child: const Text('Cadastrar'),
    );
  }
}
