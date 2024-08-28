import 'dart:convert';

import 'package:ai_mhealth_app/Screens/healthreminder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/api.dart';
import '../providers/user.provider.dart';
import '../utils/dialog.dart';

class MedicationTile extends StatefulWidget {
  const MedicationTile(
      {super.key,
      required this.name,
      required this.subtitle,
      this.onCompleted,
      this.isDone = 0});
  final String name;
  final String subtitle;
  final Function()? onCompleted;
  final int isDone;

  @override
  State<MedicationTile> createState() => _MedicationTileState();
}

class _MedicationTileState extends State<MedicationTile> {
  late bool onTap = false;
  late int isDone = widget.isDone;
  final String serverEndPoint = Api.medsEndPoint;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final userProvider = Provider.of<UserData>(context, listen: false);

    return ListTile(
      leading: const Icon(Icons.medication),
      title: Text(widget.name),
      tileColor: color.onPrimary,
      subtitle: Text(widget.subtitle),
      trailing: isDone == 0
          ? Checkbox(
          shape: const CircleBorder(),
              value: onTap,
          onChanged: (value) {
                CustomDialog.showPopUp(
                    context,
                    "COMPLETED?",
                    "Are you sure you have completed taking this medication?",
                    "YES",
                    "NO", () {
                  CustomDialog.showPopUp(
                      context,
                      "WARNING",
                      "You will no longer get daily notifications for this medication",
                      "PROCEED",
                      "CANCEL", () {
                    setState(() {
                      onTap = value!;
                    });
                    widget.onCompleted!();
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(MedicationReminderScreen.routeName),
                    );
                  }, () {
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(MedicationReminderScreen.routeName),
                    );
                  });
                }, () {
                  Navigator.pop(context);
                });
              })
          : Icon(
              Icons.check_box_outlined,
              color: color.primary,
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
