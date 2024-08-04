import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CutomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(255, 30, 102, 17)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
    );
  }
}
