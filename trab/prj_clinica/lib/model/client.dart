import 'package:prj_clinica/model/pet.dart';

class Client {
  String nm_cliente = "";
  String cd_cpf = "";
  String cd_tel = "";
  String nm_email = "";
  bool ic_propaganda = false;
  var pets = <Pet>[];

  doSomething() {
    print("Cliente: $nm_cliente");
    print("CPF: $cd_cpf");
    print("Telefone: $cd_tel");
    print("Email: $nm_email");
    print("Aceita propaganda: $ic_propaganda");
  }
}
