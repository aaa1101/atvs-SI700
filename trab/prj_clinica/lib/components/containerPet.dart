import 'package:flutter/material.dart';
import 'package:prj_clinica/model/pets.dart';

class ContainerPet extends StatelessWidget {
  const ContainerPet({super.key});

  @override
  Widget build(BuildContext context) {
    final pets = Pets.pets;
    Size size = MediaQuery.of(context).size;

    return Flexible(
      child: ListView.builder(
        itemCount: pets.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    image: DecorationImage(
                      image: AssetImage(pets[index].url_ft),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
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
                          text: '${pets[index].nome},',
                          style: TextStyle(
                            fontSize: 21,
                            color: Theme.of(context).primaryColor,
                          ),
                          children: [
                            TextSpan(
                                text: '\n${pets[index].idade} anos',
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
                          Navigator.of(context).pushNamed(
                            '/petProfile',
                            arguments: {'pet': pets[index]},
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
