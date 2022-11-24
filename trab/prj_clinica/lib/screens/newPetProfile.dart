import 'package:flutter/material.dart';
import 'package:prj_clinica/model/newPet.dart';

class NewPetProfile extends StatefulWidget {
  const NewPetProfile({super.key});

  @override
  State<NewPetProfile> createState() => _NewPetState();
}

class _NewPetState extends State<NewPetProfile> {
  final NewPet pet = NewPet();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 150, maxHeight: 150),
                child: SizedBox(
                  child: Image.asset('assets/img1.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Cadastre Seu Pet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        lblNome(),
                        lblIdade(),
                        lblEspecie(),
                        lblSexo(),
                        lblRaca(),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lblNome() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        hintText: 'Pipoca',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Insira o nome do seu pet!!'
          : null,
      onSaved: (String? inValue) => pet.nome = inValue ?? "",
    );
  }

  Widget lblIdade() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Idade',
        hintText: '12',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Informe a idade do seu pet! '
          : null,
      onSaved: (String? inValue) => pet.idade = inValue ?? "",
    );
  }

  Widget lblEspecie() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Especie',
        hintText: '',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Insira a especie do seu pet!!'
          : null,
      onSaved: (String? inValue) => pet.especie = inValue ?? "",
    );
  }

  Widget lblSexo() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Sexo',
        hintText: 'Feminino ou Masculino',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Insira o sexo do seu pet!!'
          : null,
      onSaved: (String? inValue) => pet.sexo = inValue ?? "",
    );
  }

  Widget lblRaca() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Raca',
        hintText: '',
      ),
      validator: (inValue) => (inValue == null || inValue.isEmpty)
          ? 'Insira a raca do seu pet!!'
          : null,
      onSaved: (String? inValue) => pet.raca = inValue ?? "",
    );
  }
}
