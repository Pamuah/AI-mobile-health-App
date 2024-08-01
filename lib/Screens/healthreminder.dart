import 'dart:convert';

import 'package:ai_mhealth_app/Screens/add_medication.dart';
import 'package:ai_mhealth_app/providers/medication.provider.dart';
import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:ai_mhealth_app/widgets/medication_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/api.dart';
import '../models/history.dart';
import '../models/medication.model.dart';
import '../models/notification.dart';
import '../providers/user.provider.dart';
import '../services/hive_service.dart';
import '../widgets/appbar.dart';

class MedicationReminderScreen extends StatefulWidget {
  static const routeName = '/health-reminder';
  const MedicationReminderScreen({super.key});

  @override
  State<MedicationReminderScreen> createState() =>
      _MedicationReminderScreenState();
}

class _MedicationReminderScreenState extends State<MedicationReminderScreen> {
  final String serverEndPoint = Api.medsEndPoint;
  HistoryService _historyService = HistoryService();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final String username =
        Provider.of<UserData>(context, listen: false).userName;
    final provider = Provider.of<MedicationData>(context, listen: false);
    final userProvider = Provider.of<UserData>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: MyAppBar(
          title: "Medication Reminder",
          onPressed: () {},
        ),
      ),
      // backgroundColor: color.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            RichText(
              text: TextSpan(
                  text: "Hello,",
                  style: TextStyle(
                    color: color.secondary,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                  children: [
                    TextSpan(
                      text: "\n$username",
                      style: TextStyle(
                        letterSpacing: 5,
                        color: color.secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ]),
              textAlign: TextAlign.left,
            ),
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: ShapeDecoration(
                color: color.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome \nTo Medication \nReminder",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: color.secondary,
                      ),
                    ),
                    // Text(
                    //   "\n${provider.completedMedications()} of ${provider.medicationsLength} completed",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 12,
                    //     color: color.secondary,
                    //   ),
                    // ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/medicine.png',
                  height: 100,
                  width: 100,
                ),
              ]),
            ),
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            Text(
              "Daily Review",
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color.secondary,
              ),
            ),
            const Divider(
              height: 8,
              thickness: 0.005,
            ),
            FutureBuilder(
              future: getMeds(userProvider.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/no-file.png',
                          height: 150,
                          width: 150,
                        ),
                        Text(
                          "OOps!! You have not added any medications yet",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: color.onTertiary),
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final med = snapshot.data![index];
                            return MedicationTile(
                              name: med.name,
                              isDone: med.completed == 1
                                  ? "Completed"
                                  : "In-Progress",
                              onCompleted: () {
                                setState(() {
                                  med.completed = 1;
                                });
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              height: 5,
                              thickness: 0.001,
                            );
                          },
                          itemCount: snapshot.data!.length),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddMedicationScreen.routeName);
        },
        elevation: 5,
        isExtended: true,
        shape: const CircleBorder(eccentricity: 1),
        foregroundColor: color.secondary,
        backgroundColor: color.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }

  // Get meds
  Future<List<Medication>> getMeds(userId) async {
    List<Medication> interimFiles = [];
    final res = await http.get(
      Uri.parse("$serverEndPoint/all/$userId"),
    );
    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      // print(resData);
      resData.forEach((i) {
        Medication med = Medication.fromJson(i);
        interimFiles.add(med);
      });
      // print(interimFiles);
      return interimFiles;
    } else {
      throw Exception("Unable to get Files");
    }
  }

  // Save History Data
  void saveHistory() async {
    var history = History(
        diagnosis: "prediction",
        symptoms: "symptoms",
        generatedText: "genText",
        date: DateTime.now().toString());
    print(history.date);
    await _historyService.addHistory(history);
  }
}
