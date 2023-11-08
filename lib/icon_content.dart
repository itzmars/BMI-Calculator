import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.texte})
      : super(key: key);

  final IconData icon;
  final String texte;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          texte,
          style: const TextStyle(color: Color(0xffffffff), fontSize: 18.0),
        )
      ],
    );
  }
}
