import 'package:flutter/material.dart';

class MedicationTile extends StatefulWidget {
  const MedicationTile(
      {super.key, required this.name, required this.isDone, this.onCompleted});
  final String name;
  final String isDone;
  final Function()? onCompleted;

  @override
  State<MedicationTile> createState() => _MedicationTileState();
}

class _MedicationTileState extends State<MedicationTile> {
  bool ontap = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      leading: const Icon(Icons.medication),
      title: Text(widget.name),
      tileColor: color.onPrimary,
      subtitle: Text(widget.isDone),
      trailing: Checkbox(
          shape: const CircleBorder(),
          value: ontap,
          onChanged: (value) {
            setState(() {
              ontap = value!;
            });
            widget.onCompleted!();
          }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
