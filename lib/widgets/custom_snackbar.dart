import 'package:flutter/material.dart';

class CustomSnackbar extends StatefulWidget {
  const CustomSnackbar(
      {super.key, required this.message, this.color = Colors.black26});
  final String message;
  final Color color;

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
      duration: const Duration(seconds: 1, milliseconds: 500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(widget.message),
    );
  }
}
