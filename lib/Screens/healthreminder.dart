import 'package:ai_mhealth_app/widgets/medication_tile.dart';
import 'package:flutter/material.dart';

class MedicationReminderScreen extends StatefulWidget {
  static const routeName = '/health-reminder';
  const MedicationReminderScreen({super.key});

  @override
  State<MedicationReminderScreen> createState() =>
      _MedicationReminderScreenState();
}

class _MedicationReminderScreenState extends State<MedicationReminderScreen> {
  final medications = const [
    "Nugel-O",
    "Panadol",
    "Gebedol",
    "Speman",
    "Dexatrol",
  ];
  final progress = const [
    "Completed",
    "Completed",
    "In-progress",
    "Completed",
    "In-progress"
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Medication Reminder",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.secondary,
              fontSize: 20),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      // backgroundColor: color.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            RichText(
              text: const TextSpan(
                  text: "Hello,",
                  style: TextStyle(
                    color: Color(0xFF27272A),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                  children: [
                    TextSpan(
                      text: "\nKataali",
                      style: TextStyle(
                        letterSpacing: 5,
                        color: Color(0xFF27272A),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ]),
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
                    Text(
                      "\n3 of 5 completed",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: color.secondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  "👋",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 75,
                    color: color.secondary,
                  ),
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return MedicationTile(
                      name: medications[index], isDone: progress[index]);
                },
                // padding: const EdgeInsets.symmetric(vertical: 8),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: medications.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add-medication");
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
}
