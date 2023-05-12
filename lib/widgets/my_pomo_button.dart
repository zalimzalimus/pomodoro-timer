import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MyPomoButton extends StatelessWidget {
  const MyPomoButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
