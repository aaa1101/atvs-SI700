import 'package:flutter/material.dart';
import 'package:prj_clinica/components/containerPetProfile.dart';
import 'package:prj_clinica/components/petHistoric.dart';
import 'package:prj_clinica/components/petInfos.dart';
import 'package:prj_clinica/model/pet.dart';

class PetProfile extends StatelessWidget {
  const PetProfile({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ContainerPetProfile(url_ft: pet.url_ft),
              PetInfos(pet: pet),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Agendamentos:',
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ),
                ButtonAddAppointment(),
              ],
            ),
          ),
          PetHistoric(appointments: pet.appointments),
        ],
      ),
    );
  }
}

class ButtonAddAppointment extends StatelessWidget {
  const ButtonAddAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: const CircleBorder(),
          fixedSize: const Size(10, 10)),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
