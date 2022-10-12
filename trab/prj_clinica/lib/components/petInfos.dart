import 'package:flutter/material.dart';
import 'package:prj_clinica/model/pet.dart';

class PetInfos extends StatelessWidget {
  const PetInfos({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      width: size.width * 0.45,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.teal),
        right: BorderSide(color: Colors.teal),
        bottom: BorderSide(color: Colors.teal),
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.45 - 15,
                  child: Text.rich(TextSpan(
                    text:
                        'Nome: ${pet.nome}\nIdade: ${pet.idade} anos\nGenero: ${pet.sexo}\nEspecie: ${pet.especie}\nRaca: ${pet.raca}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: const CircleBorder(),
                      fixedSize: const Size(10, 10)),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
