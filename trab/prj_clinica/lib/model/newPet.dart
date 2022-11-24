import 'package:prj_clinica/model/appointment.dart';

class NewPet {
  String nome = '';
  String url_ft = '';
  String idade = '';
  String especie = '';
  String sexo = '';
  String raca = '';
  var appointments = <Appointment>[];

  doSomething() {
    print("nome: $nome");
    print("url_ft: $url_ft");
    print("idade: $idade");
    print("especie: $especie");
    print("sexo: $sexo");
    print("raca: $raca");
  }
}
