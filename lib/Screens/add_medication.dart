import 'dart:convert';

import 'package:ai_mhealth_app/models/notification.dart';
import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:ai_mhealth_app/widgets/medication_time_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/api.dart';
import '../utils/custom_snackbar.dart';
import '../widgets/appbar.dart';

class AddMedicationScreen extends StatefulWidget {
  static const routeName = '/add-medication';

  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final String serverEndPoint = Api.medsEndPoint;

  final TimeOfDay _time = TimeOfDay.now();
  TimeOfDay? morning = TimeOfDay.now();
  TimeOfDay? afternoon = TimeOfDay.now();
  TimeOfDay? evening = TimeOfDay.now();

  @override
  void initState() {
    NotificationService.init();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final provider = Provider.of<UserData>(context, listen: false);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: MyAppBar(
          title: "Add Medication",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                CustomTextField(
                    hintText: "Medication Name", controller: nameController),
                const Divider(
                  height: 20,
                  thickness: 0.005,
                ),
                CustomTextField(
                    hintText:
                        "Medication Duration. Enter 0 if you do not know ",
                    controller: durationController),
                const Divider(
                  height: 45,
                  thickness: 0.005,
                ),
                Text(
                  "Timings",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: color.secondary,
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        TimeOfDay? interim = await showTimePicker(
                            context: context, initialTime: _time);
                        setState(() {
                          morning = interim;
                        });
                        // print(morning);
                      },
                      child: MedicationTimeCard(
                        text: "Morning",
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Icon(
                                Icons.sunny,
                                color: color.secondary,
                                size: 30,
                              ),
                            ),
                            Icon(
                              Icons.cloud,
                              color: color.secondary,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        TimeOfDay? interim = await showTimePicker(
                            context: context, initialTime: _time);
                        setState(() {
                          afternoon = interim;
                        });
                        // print(afternoon);
                      },
                      child: MedicationTimeCard(
                        text: "Afternoon",
                        child: Icon(
                          Icons.sunny,
                          color: color.secondary,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        TimeOfDay? interim = await showTimePicker(
                            context: context, initialTime: _time);
                        setState(() {
                          evening = interim;
                        });
                        // print(evening);
                      },
                      child: MedicationTimeCard(
                        text: "Evening",
                        child: Icon(
                          Icons.mode_night_outlined,
                          color: color.secondary,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 0.005,
                ),
                CustomElevatedButton(
                  text: 'Done',
                  onPressed: () async {
                    final String name = nameController.value.text.trim();
                    final String duration =
                        durationController.value.text.trim();
                    final int userId = provider.userId;
                    try {
                      if (await addMed(name, userId, duration)) {
                        if (context.mounted) {
                          CustomSnackbar(
                                  context: context,
                                  message: "Medication Added Succesfully")
                              .show();
                          NotificationService.showInstantNotification(
                              "Medication Scheduled",
                              "This shows an instant notifications");
                          Navigator.of(context).pop();
                        }
                      } else {}
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Register User
  Future<bool> addMed(name, userId, duration) async {
    Map<dynamic, dynamic> medication = {
      'name': name,
      'id': userId,
      'duration': int.parse(duration),
    };

    final res = await http.post(
      Uri.parse("$serverEndPoint/add"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(medication),
    );
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
