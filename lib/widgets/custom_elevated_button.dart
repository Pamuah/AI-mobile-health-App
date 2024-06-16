import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return SizedBox(
      height: 60,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
          onPressed();
        },
        style: ElevatedButton.styleFrom(backgroundColor: color.primary),
        child: Text(
          text,
          style: TextStyle(
              color: color.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
