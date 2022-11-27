import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/bloc/monitor_bloc.dart';

class ButtonMyPet extends StatelessWidget {
  const ButtonMyPet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      if (state.pets.length() == 0) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Pets',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/petProfile');
                    },
                    icon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.pets_outlined),
                    ),
                    label: const Text('Meus Pets'),
                  ),
                ),
              )
            ],
          ),
        );
      }

      return Positioned(
        bottom: 8,
        right: 8,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: const CircleBorder(),
              fixedSize: const Size(40, 40)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/petProfile');
          },
        ),
      );
    });
  }
}
