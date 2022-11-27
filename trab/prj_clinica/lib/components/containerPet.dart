import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/bloc/monitor_bloc.dart';
import 'package:prj_clinica/model/pet.dart';
import 'package:prj_clinica/model/pets.dart';

class ContainerPet extends StatefulWidget {
  const ContainerPet({super.key});

  @override
  State<ContainerPet> createState() => _ContainerPetState();
}

class _ContainerPetState extends State<ContainerPet> {
  @override
  Widget build(BuildContext context) {
    Pets pets;
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      pets = state.pets;
      if (pets.length() == 0) {
        return Container();
      }

      return Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: pets.length(),
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 10.0, top: 10.0),
                  child: Row(
                    children: [
                      ImagePet(size, pets.petList[index].url_ft),
                      DescPet(context, size, pets.petList[index]),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      );
    });
  }

  Widget ImagePet(Size size, String url_ft) {
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
        image: DecorationImage(
          image: AssetImage(url_ft),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget DescPet(BuildContext context, Size size, Pet pet) {
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.45 - 10,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.teal),
          right: BorderSide(color: Colors.teal),
          bottom: BorderSide(color: Colors.teal),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text.rich(
            TextSpan(
              text: '${pet.nome},',
              style: TextStyle(
                fontSize: 21,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                TextSpan(
                    text: '\n${pet.idade} anos',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal.shade400,
                    )),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: const CircleBorder(),
                fixedSize: const Size(10, 10)),
            child: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/petProfile',
                arguments: {'pet': pet},
              );
            },
          ),
        ],
      ),
    );
  }
}
