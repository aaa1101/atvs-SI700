import 'ContaCorrente.dart';
import 'ContaEspecial.dart';
import 'ContaComum.dart';

class Banco {
  List _contas = [];

  List get contas {
    return [..._contas];
  }

  set contas(c) {
    _contas = [...c];
  }

  addConta(ContaCorrente conta) {
    _contas.add(conta);
  }

  removerConta(int index) {
    _contas.remove(index);
  }

  transferencia(int id_origem, int id_destino, double vl) {
    if (id_origem == id_destino) {
      return "Conta origem e destino devem ser diferentes";
    }

    if (contas[id_origem].saldo < vl) {
      return "Saldo insulficiente";
    }

    contas[id_origem].saldo -= vl;
    contas[id_destino].saldo += vl;
  }
}

void main(List<String> args) {
  var banco = Banco();
  ContaEspecial a = ContaEspecial("conta a");
  a.saldo = 100.0;

  ContaComum b = ContaComum("conta b");
  b.saldo = 15.0;

  banco.addConta(a);
  banco.addConta(b);
  print("##Inicio \n${banco.contas}");

  banco.transferencia(0, 1, 35.0);
  print("\n##Tranferencia correta \n${banco.contas}");

  banco.transferencia(0, 1, 200.0);
  print("\n##Saldo indisponivel \n${banco.contas}");

  banco.transferencia(1, 1, 10.0);
  print("\n##Mesmas contas \n${banco.contas}");
}
