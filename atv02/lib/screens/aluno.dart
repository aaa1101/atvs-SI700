import 'package:flutter/material.dart';

class Aluno extends StatelessWidget {
  const Aluno({
    super.key,
    required this.nm_aluno,
    required this.desc_aluno,
    required this.url_ft,
  });

  final String nm_aluno;
  final String desc_aluno;
  final String url_ft;

  @override
  Widget build(BuildContext context) {
    String a = 'nome';

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
            SizedBox(
              width: 200,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: nm_aluno.replaceRange(
                      nm_aluno.indexOf(' '), nm_aluno.length, ''),
                  style: const TextStyle(fontSize: 35),
                  children: [
                    TextSpan(
                      text:
                          "\n${nm_aluno.replaceRange(0, nm_aluno.indexOf(' '), '')}",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Text(
                desc_aluno,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
