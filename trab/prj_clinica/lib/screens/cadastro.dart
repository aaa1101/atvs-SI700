import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../model/client.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
            child: SizedBox(
              child: Image.asset('assets/img1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const Center(
                        child: Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                      ),
                    )),
                    lblNome(),
                    lblCPF(),
                    lblTel(),
                    lblEmail(),
                    lblPassword(),
                    chkPropaganda(),
                    btnCadastrar(),
                  ],
                )),
          ),
        ],
      ),
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
        hintText: 'exemplo@gmail.com',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Informe seu endereco de e-mail'
          : null,
      onSaved: (inValue) => client.nm_email = inValue ?? "",
    );
  }

  Widget lblPassword() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Senha',
        hintText: '**************',
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Informe sua senha senha' : null,
      onSaved: (newValue) => print(newValue),
    );
  }

  Widget chkPropaganda() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Checkbox(
            value: client.ic_propaganda,
            onChanged: (bool? inValue) {
              if (inValue != null) {
                setState(() {
                  client.ic_propaganda = inValue;
                });
              }
            },
          ),
          const Text(
            'Aceito receber informações e novidades por email',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
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
            formkey.currentState?.reset();
          }
        },
        child: const Text("Cadastrar"),
      ),
    );
  }
}
