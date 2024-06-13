import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {super.key, required this.icon, required this.name, required this.onTap});
  final IconData icon;
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 30),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          children: [
            Icon(
              icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color.secondary),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
