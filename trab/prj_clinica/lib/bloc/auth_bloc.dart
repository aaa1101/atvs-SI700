import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/model/client.dart';
import 'package:prj_clinica/provider/firebase_firestore.dart';
import '../provider/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) async {
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        FirestoreDatabase.helper.uid = event.userModel!.uid;
        Client client =
            await FirestoreDatabase.helper.getClient(event.userModel!.uid);
        emit(Authenticated(userModel: client));
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        await _authenticationService.createUserWithEmailAndPassword(
            event.client, event.password);
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });

    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.username, event.password);
      } catch (e) {
        emit(AuthError(
            message:
                "Impossível Logar com ${event.username}: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efeturar Logout: ${e.toString()}"));
      }
    });
  }
}

/*
   Eventos
*/
abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  Client client;
  String password;

  RegisterUser({required this.client, required this.password});
}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final Client? userModel;
  AuthServerEvent(this.userModel);
}

/*
Estados
*/

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  Client userModel;
  Authenticated({required this.userModel});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
