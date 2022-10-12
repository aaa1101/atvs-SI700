import 'package:flutter/material.dart';

class ButtonAddPet extends StatelessWidget {
  const ButtonAddPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: const CircleBorder(),
            fixedSize: const Size(40, 40)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
