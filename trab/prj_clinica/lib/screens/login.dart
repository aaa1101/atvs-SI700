import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset('assets/img1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  lblEmail(),
                  lblPassword(),
                  btnLogin(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget lblEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'exemplo@gmail.com',
      ),
      validator: (value) => (value == null || value.isEmpty)
          ? 'Informe um endereco de email valido'
          : null,
      onSaved: (newValue) => print(newValue),
    );
  }

  Widget lblPassword() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Senha',
        hintText: '**************',
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Informe sua senha senha' : null,
      onSaved: (newValue) => print(newValue),
    );
  }

  Widget btnLogin() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();
              print('clicou');

              formkey.currentState?.reset();
            }
          },
          child: const Text('Login')),
    );
  }
}
