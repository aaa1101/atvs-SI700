import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  String username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Container();
        } else {
          return unauthenticatedWidget(context, formkey);
        }
      },
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro ao efetuar o login"),
                  content: Text(state.message),
                );
              });
        } else if (state is Authenticated) {
          Navigator.popUntil(context, (route) => false);
          Navigator.pushNamed(context, '/home');
        }
      },
    );
  }

  Widget unauthenticatedWidget(
      BuildContext context, GlobalKey<FormState> formkey) {
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
                  btnLogin(context, formkey),
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
      onSaved: (String? inValue) => username = inValue!,
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
      onSaved: (String? inValue) => _password = inValue!,
    );
  }

  Widget btnLogin(BuildContext context, GlobalKey<FormState> formkey) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();

              BlocProvider.of<AuthBloc>(context)
                  .add(LoginUser(username: username, password: _password));
            }
          },
          child: const Text('Login')),
    );
  }
}
