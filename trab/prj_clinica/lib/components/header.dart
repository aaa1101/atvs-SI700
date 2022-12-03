import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String name;
  const Header({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(
        height: size.height * 0.2,
        child: Stack(children: [
          Container(
            height: size.height * 0.2 - 35,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text.rich(
              TextSpan(
                text: 'Seja bem-vindo(a),',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                children: [
                  TextSpan(
                    text: "\n       $name",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: size.width / 2 - 35,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 50,
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                      )
                    ],
                    image: const DecorationImage(
                        image: AssetImage('assets/images.jpeg'))),
              ))
        ]),
      )
    ]);
  }
}
