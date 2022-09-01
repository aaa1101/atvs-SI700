abstract class ContaCorrente {
  String _cliente = "";
  double _saldo = 0.0;

  String get cliente {
    return _cliente;
  }

  double get saldo {
    return _saldo;
  }

  set cliente(cli) {
    _cliente = cli;
  }

  set saldo(vl) {
    _saldo = vl;
  }

  ContaCorrente(cliente) {
    _cliente = cliente;
  }

  String toString() {
    return "Cliente: ${cliente}, saldo= ${saldo}";
  }
}
