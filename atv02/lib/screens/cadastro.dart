import 'dart:math';

import 'package:atv02/model/client.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final Client client = Client();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
          key: formkey,
          child: Column(
            children: [
              const Center(
                  child: Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),
              )),
              lblNome(),
              lblCPF(),
              lblTel(),
              lblEmail(),
              const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Quantos pets voce deseja cadastrar?',
                    style: TextStyle(fontSize: 16),
                  )),
              Row(children: [radQtdAnimal(1), const Text("1 pet")]),
              Row(children: [radQtdAnimal(2), const Text("2 pets")]),
              Row(children: [radQtdAnimal(3), const Text("3 pets")]),
              Row(children: [radQtdAnimal(4), const Text("4 pets")]),
              Row(children: [radQtdAnimal(5), const Text("5 ou mais pets")]),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(children: [
                  chkPropaganda(),
                  const Text(
                    'Aceito receber informações e novidades por email',
                    style: TextStyle(fontSize: 12),
                  )
                ]),
              ),
              btnCadastrar(),
            ],
          )),
    );
  }

  Widget lblNome() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome completo:',
        hintText: 'Maria Silva',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Insira seu nome completo'
          : null,
      onSaved: (String? inValue) => client.nm_cliente = inValue ?? "",
    );
  }

  Widget lblCPF() {
    var cpf = MaskTextInputFormatter(mask: '###.###.###-##');

    return TextFormField(
      inputFormatters: [cpf],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'CPF:',
        hintText: '999.999.999-99',
      ),
      validator: (inValue) =>
          (inValue == null || inValue.isEmpty) ? 'Informe seu CPF' : null,
      onSaved: (String? inValue) => client.cd_cpf = inValue ?? "",
    );
  }

  Widget lblTel() {
    var tel = MaskTextInputFormatter(mask: '(##) #####-####');

    return TextFormField(
      inputFormatters: [tel],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Numero para contato:',
        hintText: '(99) 99999-9999',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Informe um numero para contato'
          : null,
      onSaved: (String? inValue) => client.cd_tel = inValue ?? "",
    );
  }

  Widget lblEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'E-mail:',
        hintText: 'maria.silva@gmail.com',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Informe seu endereco de e-mail'
          : null,
      onSaved: (inValue) => client.nm_email = inValue ?? "",
    );
  }

  Widget radQtdAnimal(int value) {
    return Radio(
        value: value,
        groupValue: client.qtd_pets,
        onChanged: (int? inValue) {
          if (inValue != null) {
            setState(() {
              client.qtd_pets = inValue;
            });
          }
        });
  }

  Widget chkPropaganda() {
    return Checkbox(
      value: client.ic_propaganda,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            client.ic_propaganda = inValue;
          });
        }
      },
    );
  }

  Widget btnCadastrar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            client.doSomething();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "Cadastrado realizado com sucesso!!",
                    textAlign: TextAlign.center,
                  )),
            );
          }
        },
        child: const Text("Cadastrar"),
      ),
    );
  }
}
