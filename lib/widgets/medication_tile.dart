import 'package:flutter/material.dart';

class MedicationTile extends StatelessWidget {
  const MedicationTile({super.key, required this.name, required this.isDone});
  final String name;
  final String isDone;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      leading: const Icon(Icons.medication),
      title: Text(name),
      tileColor: color.onPrimary,
      subtitle: Text(isDone),
      trailing: const Icon(Icons.arrow_right_outlined),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
