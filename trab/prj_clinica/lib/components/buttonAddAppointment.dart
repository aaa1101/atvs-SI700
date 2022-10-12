import 'package:flutter/material.dart';

class ButtonAddAppointment extends StatelessWidget {
  const ButtonAddAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: const CircleBorder(),
          fixedSize: const Size(10, 10)),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
