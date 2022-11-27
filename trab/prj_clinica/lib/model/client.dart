class Client {
  String uid = '';
  String nm_cliente = '';
  String cd_cpf = '';
  String cd_tel = '';
  String nm_email = '';
  bool ic_propaganda = false;

  Client({
    this.uid = '',
    this.nm_cliente = '',
    this.cd_cpf = '',
    this.cd_tel = '',
    this.nm_email = '',
    this.ic_propaganda = false,
  });

  Client.fromMap(map) {
    nm_cliente = map['nome'];
    cd_cpf = map['cpf'];
    cd_tel = map['tel'];
    nm_email = map['email'];
  }

  doSomething() {
    print("Cliente: $nm_cliente");
    print("CPF: $cd_cpf");
    print("Telefone: $cd_tel");
    print("Email: $nm_email");
    print("Aceita propaganda: $ic_propaganda");
  }
}
