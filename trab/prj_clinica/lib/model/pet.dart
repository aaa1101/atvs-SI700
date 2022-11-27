import 'package:prj_clinica/model/appointment.dart';

class Pet {
  String id = "";
  String nome = '';
  String url_ft = 'assets/img1.png';
  int idade = 0;
  String especie = '';
  String sexo = '';
  String raca = '';
  var appointments = <Appointment>[];

  Pet({
    this.nome = '',
    this.url_ft = 'assets/img1.png',
    this.idade = 0,
    this.especie = '',
    this.sexo = '',
    this.raca = '',
    list_appointments = null,
  }) {
    if (list_appointments != null) appointments.addAll(list_appointments);
  }

  Pet.withData({
    this.nome = '',
    this.url_ft = 'assets/img1.png',
    this.idade = 0,
    this.especie = '',
    this.sexo = '',
    this.raca = '',
    list_appointments = null,
  }) {
    if (list_appointments != null) appointments.addAll(list_appointments);
  }

  Pet.fromMap(map) {
    nome = map['nome'];
    idade = map['idade'];
    especie = map['especie'];
    sexo = map['sexo'];
    raca = map['raca'];
  }

  toMap() {
    var map = <String, dynamic>{};
    map['nome'] = nome;
    map['idade'] = idade;
    map['especie'] = especie;
    map['sexo'] = sexo;
    map['raca'] = raca;
    return map;
  }
}
