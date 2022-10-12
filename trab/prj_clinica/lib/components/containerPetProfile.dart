import 'package:flutter/material.dart';

class ContainerPetProfile extends StatelessWidget {
  const ContainerPetProfile({super.key, required this.url_ft});
  final String url_ft;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
      ),
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0)),
          image: DecorationImage(
            image: AssetImage(url_ft),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
