import 'package:prj_clinica/model/appointment.dart';
import 'package:prj_clinica/model/pet.dart';

class Pets {
  static List<Pet> pets = [
    Pet(
        nome: 'Pompom',
        url_ft: 'assets/img1.png',
        idade: 10,
        especie: 'gato',
        raca: 'siamês thai',
        sexo: 'macho',
        list_appointments: [
          Appointment(date: '09/09/2022', hour: '12:00', finished: true),
          Appointment(date: '12/10/2022', hour: '18:00', finished: true),
          Appointment(date: '25/11/2022', hour: '09:00', finished: false),
        ]),
    Pet(
        nome: 'Tufi',
        url_ft: 'assets/img1.png',
        idade: 6,
        especie: 'gato',
        raca: 'persa mistura',
        sexo: 'fêmea',
        list_appointments: [
          Appointment(date: '12/10/2022', hour: '08:00', finished: true),
          Appointment(date: '22/12/2022', hour: '10:00', finished: false),
          Appointment(date: '19/05/2022', hour: '14:00', finished: true),
        ]),
    Pet(
        nome: 'Mino',
        url_ft: 'assets/img1.png',
        idade: 2,
        especie: 'gato',
        raca: 'siamês',
        sexo: 'macho',
        list_appointments: [
          Appointment(date: '19/05/2022', hour: '14:00', finished: true),
          Appointment(date: '13/12/2022', hour: '15:00', finished: false),
        ]),
    Pet(
        nome: 'Romrom',
        url_ft: 'assets/img1.png',
        idade: 2,
        especie: 'gato',
        raca: 'vira-lata',
        sexo: 'macho'),
    Pet(
        nome: 'Fofusha',
        url_ft: 'assets/img1.png',
        idade: 2,
        especie: 'gato',
        raca: 'persa',
        sexo: 'fêmea',
        list_appointments: [
          Appointment(date: '09/06/2022', hour: '06:00', finished: true),
          Appointment(date: '12/10/2022', hour: '08:00', finished: true),
          Appointment(date: '22/12/2022', hour: '10:00', finished: false),
          Appointment(date: '19/05/2022', hour: '14:00', finished: true),
          Appointment(date: '13/06/2022', hour: '15:00', finished: true),
        ]),
  ];

  List<String> idPetList = [];
  List<Pet> petList = [];

  Pets() {
    idPetList = [];
    petList = [];
  }

  int length() {
    return petList.length;
  }

  Pet getPetAtIndex(int index) {
    Pet pet = petList[index];
    return Pet.withData(
        nome: pet.nome,
        idade: pet.idade,
        especie: pet.especie,
        sexo: pet.sexo,
        raca: pet.raca);
  }

  String getIdAtIndex(int index) {
    return idPetList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idPetList.length; i++) {
      if (id == idPetList[i]) {
        return i;
      }
    }

    return -1;
  }

  updateOrInsertPetOfId(String id, Pet pet) {
    int index = getIndexOfId(id);
    if (index != -1) {
      petList[index] = Pet.withData(
          nome: pet.nome,
          idade: pet.idade,
          especie: pet.especie,
          sexo: pet.sexo,
          raca: pet.raca);
    } else {
      idPetList.add(id);
      petList.add(Pet.withData(
          nome: pet.nome,
          idade: pet.idade,
          especie: pet.especie,
          sexo: pet.sexo,
          raca: pet.raca));
    }
  }

  updatePetOfId(String id, Pet pet) {
    int index = getIndexOfId(id);
    if (index != -1) {
      petList[index] = Pet.withData(
          nome: pet.nome,
          idade: pet.idade,
          especie: pet.especie,
          sexo: pet.sexo,
          raca: pet.raca);
    }
  }

  deletePetOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      petList.removeAt(index);
      idPetList.removeAt(index);
    }
  }

  insertPetOfId(String id, Pet pet) {
    idPetList.add(id);
    petList.add(Pet.withData(
        nome: pet.nome,
        idade: pet.idade,
        especie: pet.especie,
        sexo: pet.sexo,
        raca: pet.raca));
  }
}
