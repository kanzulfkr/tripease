import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isButtonPressed = !_isButtonPressed;
        });
      },
      style: ButtonStyle(
        backgroundColor: _isButtonPressed
            ? MaterialStateProperty.all(Colors.blue)
            : MaterialStateProperty.all(Colors.transparent),
        side: _isButtonPressed
            ? MaterialStateProperty.all(BorderSide.none)
            : MaterialStateProperty.all(
                const BorderSide(color: Colors.grey),
              ),
      ),
      child: const Text('Button'),
    );
  }
}
