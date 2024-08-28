import 'dart:convert';

import 'package:ai_mhealth_app/Screens/healthreminder.dart';
import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/models/notification.dart';
import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:ai_mhealth_app/utils/dialog.dart';
import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:ai_mhealth_app/widgets/medication_time_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart' as date;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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
  // final TextEditingController durationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String serverEndPoint = Api.medsEndPoint;
  // final NotifyService _notifyService = NotifyService();

  // final TimeOfDay _time = TimeOfDay.now();
  DateTime? morning;
  DateTime? afternoon;
  DateTime? evening;

  int? morningId;
  int? afternoonId;
  int? eveningId;

  @override
  void dispose() {
    nameController.dispose();
    // durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final provider = Provider.of<UserData>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: MyAppBar(
          title: "Add Medication",
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const MedicationReminderScreen();
            }));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
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
                  // CustomTextField(
                  //     hintText:
                  //         "Medication Duration. Enter 0 if you do not know ",
                  //     controller: durationController),
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
                          DatePicker.showTimePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (time) => morning = time,
                            onConfirm: (time) {
                              morningId = const Uuid().v4().hashCode;
                              morning = time;
                            },
                          );
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
                          DatePicker.showTimePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (time) => afternoon = time,
                            onConfirm: (time) {
                              afternoonId = const Uuid().v4().hashCode;
                              afternoon = time;
                            },
                          );
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
                          DatePicker.showTimePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (time) => evening = time,
                            onConfirm: (time) {
                              eveningId = const Uuid().v4().hashCode;
                              evening = time;
                            },
                          );
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
                    height: 70,
                    thickness: 0.005,
                  ),
                  CustomElevatedButton(
                    text: 'Done',
                    onPressed: () async {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const MedicationReminderScreen();
                      // }));
                      SystemChannels.textInput
                          .invokeMethod<void>('TextInput.hide');
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        if (morning == null &&
                            afternoon == null &&
                            evening == null) {
                          CustomDialog.showPopUp(
                              context,
                              "WARNING",
                              "You must choose at least one of the timings to proceed",
                              "OK",
                              null, () {
                            Navigator.pop(context);
                          }, () {});
                        } else {
                          final String name = nameController.value.text.trim();
                          final int userId = provider.userId;
                          final medId = const Uuid().v4().hashCode;
                          try {
                            if (await addMed(name, userId, medId, morningId,
                                afternoon, eveningId)) {
                              if (morning != null) {
                                // Schule for morning
                                NotificationService.scheduleNotification(
                                    morningId!,
                                    name,
                                    "Medication Reminder",
                                    morning!);
                                // saveMedNotification("Med Scheduled",
                                //     "$name scheduled for $morning everyday.");
                              }
                              if (afternoon != null) {
                                // Schule for afternoon
                                NotificationService.scheduleNotification(
                                    afternoonId!,
                                    name,
                                    "Medication Reminder",
                                    afternoon!);
                                // saveMedNotification("Med Scheduled",
                                //     "$name scheduled for $afternoon everyday.");
                              }
                              if (evening != null) {
                                // Schule for evening
                                NotificationService.scheduleNotification(
                                    eveningId!,
                                    name,
                                    "Medication Reminder",
                                    evening!);
                                // saveMedNotification("Med Scheduled",
                                //     "$name scheduled for $evening everyday.");
                              }
                              if (context.mounted) {
                                CustomSnackbar(
                                        context: context,
                                        message: "Medication Added Succesfully")
                                    .show();
                                NotificationService.showInstantNotification(
                                    "Medication Scheduled",
                                    "$name has been scheduled successfully");
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              }
                            } else {}
                          } catch (e) {
                            print(e);
                          }
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Register User
  Future<bool> addMed(
      name, userId, medId, morningId, afternoonId, eveningId) async {
    Map<dynamic, dynamic> medication = {
      'name': name,
      'id': userId,
      'medId': medId,
      'morningId': morningId,
      'afternoonId': afternoonId,
      'eveningId': eveningId
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

  // Save History Data
  // void saveMedNotification(title, info) async {
  //   DateTime now = DateTime.now();
  //   var notification = Notify(
  //       id: const Uuid().v4().hashCode,
  //       title: title,
  //       info: info,
  //       date: DateFormat('yyyy-MM-dd - kk:mm').format(now).toString());
  //   await _notifyService.addNotification(notification);
  // }
}
