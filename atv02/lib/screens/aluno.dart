import 'dart:io';
import 'package:flutter/material.dart';

class Aluno extends StatelessWidget {
  const Aluno({super.key});
  //add parametro pra nome, sobrenome e ft

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 170,
              child: Image.asset('assets/images/img1.png'),
            ),
            const SizedBox(
              width: 200,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Nome',
                  style: TextStyle(fontSize: 35),
                  children: [
                    TextSpan(
                      text: "\nSobrenome",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 350,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet semper dolor. Vestibulum turpis nisi, ornare facilisis fringilla ac, ultrices scelerisque massa. Phasellus vitae quam in quam congue feugiat eu ornare diam.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
