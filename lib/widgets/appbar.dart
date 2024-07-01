import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: color.primary,
      title: Text(
        title,
        style: TextStyle(color: color.onPrimary, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      leading: Container(
        height: 55,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.primary,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: color.onPrimary,
          ),
        ),
      ),
    );
  }
}
