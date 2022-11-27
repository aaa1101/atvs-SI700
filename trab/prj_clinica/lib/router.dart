import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/bloc/auth_bloc.dart';
import 'package:prj_clinica/bloc/manage_bloc.dart';
import 'package:prj_clinica/bloc/monitor_bloc.dart';
import 'package:prj_clinica/screens/cadastro.dart';
import 'package:prj_clinica/screens/home.dart';
import 'package:prj_clinica/screens/index.dart';
import 'package:prj_clinica/screens/login.dart';
import 'package:prj_clinica/screens/petProfile.dart';
import 'package:prj_clinica/screens/screenAddPet.dart';

class AppRouter {
  final AuthBloc _authBloc = AuthBloc();
  final MonitorBloc _monitorBloc = MonitorBloc();
  final ManageBloc _manageBloc = ManageBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const IndexPage());
      case '/login':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _authBloc,
                  child: LoginPage(),
                ));
      case '/cadastro':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _authBloc,
                  child: const Cadastro(),
                ));
      case '/home':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _authBloc),
                    BlocProvider.value(value: _monitorBloc),
                    BlocProvider.value(value: _manageBloc),
                  ],
                  child: const HomePage(),
                ));
      case '/petProfile':
        return MaterialPageRoute(builder: (context) {
          try {
            var args = routeSettings.arguments as Map;
            return PetProfile(pet: args['pet']);
          } catch (_) {
            return const HomePage();
          }
        });
      case '/screenAddPet':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _manageBloc),
                    BlocProvider.value(value: _monitorBloc),
                  ],
                  child: const ScreenAddPet(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const IndexPage());
    }
  }
}
