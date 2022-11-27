import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/bloc/auth_bloc.dart';
import 'package:prj_clinica/screens/index.dart';
import 'package:prj_clinica/screens/login.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Erro ao efetuar login"),
                    content: Text(state.message),
                  );
                });
          }
        },
        builder: (context, state) {
          if (state is Authenticated) {
            try {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } catch (_) {
              print('deu erro');
              return const IndexPage();
            }
          } else {
            try {
              return LoginPage();
              // Navigator.pushNamed(context, '/login');
            } catch (_) {
              print('deu erro');
              return const IndexPage();
            }
          }
          return Container();
        },
      ),
    );
  }
}
