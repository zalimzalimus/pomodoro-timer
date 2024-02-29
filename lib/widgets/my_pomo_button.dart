import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MyPomoButton extends StatelessWidget {
  const MyPomoButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalLow,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
