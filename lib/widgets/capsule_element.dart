import 'package:flutter/material.dart';

class CapsuleElement extends StatelessWidget {
  final String content;
  final Color color;
  final Color textColor;

  const CapsuleElement(
    this.content, {
    required this.color,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          content,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
