import 'package:flutter/material.dart';

class AccountInfoTile extends StatelessWidget {
  const AccountInfoTile(
      {super.key, required this.property, required this.value});
  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(
        property,
        style: TextStyle(
          color: color.tertiary,
          fontSize: 18,
        ),
      ),
      trailing: SizedBox(
        width: 150,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: TextStyle(color: color.secondary, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
