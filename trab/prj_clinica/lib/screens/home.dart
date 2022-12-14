import 'package:flutter/material.dart';
import 'package:prj_clinica/components/buttonAddAppointment.dart';
import 'package:prj_clinica/components/buttonAddPet.dart';
import 'package:prj_clinica/components/containerPet.dart';
import 'package:prj_clinica/components/header.dart';
import 'package:prj_clinica/screens/appointmentPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .restorablePushNamedAndRemoveUntil('/', (route) => false);
            },
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
              fixedSize: const Size(20, 20),
            ),
            child: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          Column(
            children: [
              const Header(),
              Flexible(
                child: Stack(
                  children: const [
                    ContainerPet(),
                    ButtonAddPet(),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Header(),
              AppointmentPage(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ButtonAddAppointment(size: Size(40, 40)),
              ),
            ],
          ),
          Column(
            children: const [
              Header(),
              Text('Vou fazer? eis a questao'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _currentScreen,
        onTap: (value) {
          setState(() => _currentScreen = value);
        },
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
