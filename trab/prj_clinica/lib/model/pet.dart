import 'package:prj_clinica/model/appointment.dart';

class Pet {
  String nome = '';
  String url_ft = '';
  int idade = 0;
  String especie = '';
  String sexo = '';
  String raca = '';
  var appointments = <Appointment>[];

  Pet({
    required this.nome,
    required this.url_ft,
    required this.idade,
    required this.especie,
    required this.sexo,
    required this.raca,
    list_appointments = null,
  }) {
    if (list_appointments != null) appointments.addAll(list_appointments);
  }
}
