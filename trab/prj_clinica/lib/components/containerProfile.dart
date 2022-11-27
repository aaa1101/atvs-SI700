import 'package:flutter/material.dart';
import 'package:prj_clinica/components/buttonMyPets.dart';
import 'package:prj_clinica/components/petInfos.dart';
import 'package:prj_clinica/model/client.dart';
import 'package:prj_clinica/model/pet.dart';

class ContainerProfile extends StatefulWidget {
  const ContainerProfile({super.key});

  @override
  State<ContainerProfile> createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  @override
  Widget build(BuildContext context) {
    Client client = Client();
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      width: size.width * 0.45,
      decoration: const BoxDecoration(
        color: Colors.teal,
        border: Border(
          top: BorderSide(color: Colors.teal),
          right: BorderSide(color: Colors.teal),
          left: BorderSide(color: Colors.teal),
          bottom: BorderSide(color: Colors.teal),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 10.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              SizedBox(
                height: size.height * 0.2,
                width: size.width * 0.45 - 15,
                child: Text.rich(TextSpan(
                  text:
                      'CPF: ${client.cd_cpf} \nTelefone: ${client.cd_tel}\nEmail: ${client.nm_email}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
        ]),
      ),
    );
  }
}
