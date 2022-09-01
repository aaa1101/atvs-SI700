import 'ContaCorrente.dart';

class ContaEspecial extends ContaCorrente {
  double _taxaDeJuros = 0.0;

  double get taxaDeJuros {
    return _taxaDeJuros;
  }

  set taxaDeJuros(vl) {
    _taxaDeJuros = vl;
  }

  ContaEspecial(cli) : super(cli);

  aplicaCorrecao() {
    saldo = saldo * (1 + taxaDeJuros);
  }
}
