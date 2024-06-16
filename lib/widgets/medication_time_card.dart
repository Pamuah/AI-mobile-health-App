import 'package:flutter/material.dart';

class MedicationTimeCard extends StatelessWidget {
  const MedicationTimeCard(
      {super.key, required this.text, required this.child});
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            height: 70,
            width: 70,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: color.primary,
            ),
            child: child,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: color.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
