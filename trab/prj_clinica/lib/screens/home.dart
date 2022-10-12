import 'package:flutter/material.dart';
import 'package:prj_clinica/components/buttonAddPet.dart';
import 'package:prj_clinica/components/containerPet.dart';
import 'package:prj_clinica/components/header.dart';

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
            children: const [
              Header(),
              Text('Nao faco ideia de como vou fazer isso'),
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


/* 
 Container(
            child: ListTile(
                leading: Image.asset(pets[index].url_ft),
                title: Text(pets[index].nome),
                trailing: Text(
                  pets[index].idade.toString(),
                )),
          );



Row(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    color: Colors.indigo,
                    image: DecorationImage(
                      image: AssetImage(pets[index].url_ft),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),


borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
 */

//pag de animal
//perfil
//agenda consultas
//minhas consultas
//sair
