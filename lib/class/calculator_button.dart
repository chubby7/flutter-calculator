import 'package:flutter/material.dart';
import 'package:calculator/constants.dart';

class Calc_Button extends StatelessWidget {
  Calc_Button({
    super.key,
    required this.onTap,
    required this.character,
    this.colour,
  });

  final String character;
  final VoidCallback onTap;
  final Color? colour;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colour ?? Color(0xFF123E5C),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(character, style: kButtonTextStyle)),
        ),
      ),
    );
  }
}
