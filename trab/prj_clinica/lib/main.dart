import 'package:flutter/material.dart';
import 'package:prj_clinica/router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCVFR-duoOlU_wM02iISudKRXHrYfzPiIc",
    appId: "1:255764396731:web:91c5fd8890fb7e390bc79e",
    messagingSenderId: "255764396731",
    projectId: "si700prjclinicavet",
    authDomain: "si700prjclinicavet.firebaseapp.com",
    storageBucket: "si700prjclinicavet.appspot.com",
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinica Vet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      //remover arquivo wrapper na pasta screen
    );
  }
}
