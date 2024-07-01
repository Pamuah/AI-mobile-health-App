import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key, required this.icon, required this.name, required this.onTap});
  final IconData icon;
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 30),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: ListTile(
          onTap: () {
            onTap();
          },
          leading: Icon(icon),
          title: Text(
            name,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color.secondary),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
