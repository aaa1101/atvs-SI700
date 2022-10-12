import 'package:flutter/material.dart';

class ButtonAddAppointment extends StatelessWidget {
  final Size size;
  const ButtonAddAppointment({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: const CircleBorder(),
          fixedSize: size),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
