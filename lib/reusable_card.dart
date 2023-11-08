import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {Key? key, required this.color, this.childCard, this.onPress});

  final Color color;
  final Widget? childCard;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: childCard,
      ),
    );
  }
}
