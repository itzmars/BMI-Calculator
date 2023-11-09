import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        child: Center(
            child: Text(
          label,
          style: kBottomButtonTextStyle,
        )),
      ),
    );
  }
}
