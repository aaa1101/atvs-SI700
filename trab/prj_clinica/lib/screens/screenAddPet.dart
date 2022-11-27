import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prj_clinica/bloc/manage_bloc.dart';
import 'package:prj_clinica/bloc/monitor_bloc.dart';
import 'package:prj_clinica/model/pet.dart';

class ScreenAddPet extends StatefulWidget {
  const ScreenAddPet({super.key});

  @override
  State<ScreenAddPet> createState() => _ScreenAddPetState();
}

class _ScreenAddPetState extends State<ScreenAddPet> {
  Pet pet = Pet(sexo: 'Fêmea');
  String radioValue = 'Fêmea';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: unauthenticatedWidget(formkey),
        ),
      ),
    );
  }

  Widget unauthenticatedWidget(GlobalKey<FormState> formkey) {
    return Column(
      children: [
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
                  lblIdade(),
                  lstEspecie(),
                  lblRaca(),
                  radSexo(),
                  btnCadastrar(),
                ],
              )),
        ),
      ],
    );
  }

  Widget lblNome() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Nome',
          hintText: 'Max',
        ),
        validator: (inValue) => (inValue == null || inValue.isEmpty)
            ? 'Insira o nome do seu pet'
            : null,
        onSaved: (String? inValue) => pet.nome = inValue ?? "",
      ),
    );
  }

  Widget lblIdade() {
    var age = MaskTextInputFormatter(mask: '###');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        inputFormatters: [age],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Idade',
          hintText: '2 anos (apenas números)',
        ),
        validator: (inValue) => (inValue == null || inValue.isEmpty)
            ? 'Insira a idade de seu pet'
            : null,
        onSaved: (String? inValue) => pet.idade = int.parse(inValue!),
      ),
    );
  }

  Widget lstEspecie() {
    String dropdownvalue = '-- Selecione uma espécie --';
    List<String> species = [
      '-- Selecione uma espécie --',
      'Cachorro',
      'Coelho',
      'Gato',
      'Hamster',
      'Tartaruga'
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: species.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        isExpanded: true,
        onChanged: (String? value) {
          setState(() {
            dropdownvalue = value!;
          });
        },
        onSaved: (value) {
          setState(() {
            dropdownvalue = value as String;
            pet.especie = value;
          });
        },
        validator: (String? value) => (value == '-- Selecione uma espécie --')
            ? 'Selecione a espécie do seu animal'
            : null,
      ),
    );
  }

  Widget radSexo() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio(
            value: 'Fêmea',
            groupValue: radioValue,
            onChanged: updateRadio,
          ),
          const Text('Fêmea'),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Radio(
              value: 'Macho',
              groupValue: radioValue,
              onChanged: updateRadio,
            ),
          ),
          const Text('Macho'),
        ],
      ),
    );
  }

  updateRadio(String? inValue) {
    if (inValue != null) {
      setState(() {
        radioValue = inValue;
        pet.sexo = inValue;
      });
    }
  }

  Widget lblRaca() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Raça',
          hintText: 'Siamês',
        ),
        validator: (inValue) => (inValue == null || inValue.isEmpty)
            ? 'Informe a raça do seu pet, caso não saiba, infome como "vira-lata"'
            : null,
        onSaved: (String? inValue) => pet.raca = inValue ?? "",
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
            // // client.doSomething();
            // BlocProvider.of<AuthBloc>(context)
            //     .add(RegisterUser(client: client, password: _password));
            print(pet.nome);
            print(pet.especie);
            print(pet.idade);
            print(pet.raca);
            print(pet.sexo);

            BlocProvider.of<ManageBloc>(context).add(SubmitEvent(pet: pet));
            BlocProvider.of<MonitorBloc>(context).add(AskNewList());
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //       backgroundColor: Colors.green,
            //       content: Text(
            //         "Cadastrado realizado com sucesso!!",
            //         textAlign: TextAlign.center,
            //       )),
            // );
          }
        },
        child: const Text("Cadastrar"),
      ),
    );
  }
}
