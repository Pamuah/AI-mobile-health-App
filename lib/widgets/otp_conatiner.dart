import 'package:flutter/material.dart';

class OtpContainer extends StatelessWidget {
  const OtpContainer({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      height: 90,
      width: 65,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: color.secondary, width: 1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 30,
              color: color.secondary,
            ),
            decoration: const InputDecoration(
              hintText: "0",
              hintStyle: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
