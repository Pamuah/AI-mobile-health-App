import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.contentPadding,
      required this.height,
      required this.width});

  final String hintText;
  final double height;
  final double width;
  final TextEditingController controller;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: SizedBox(
        height: height,
        width: width,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: color.secondary, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 18,
                color: color.tertiary,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
