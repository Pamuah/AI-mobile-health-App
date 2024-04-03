import 'package:flutter/material.dart';

class MedicationReminderScreen extends StatefulWidget {
  static const routeName = '/HealthReminder';
  const MedicationReminderScreen({super.key});

  @override
  State<MedicationReminderScreen> createState() =>
      _MedicationReminderScreenState();
}

class _MedicationReminderScreenState extends State<MedicationReminderScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Medication \nReminder",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      backgroundColor: color.background,
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
              height: 150,
              decoration: ShapeDecoration(
                color: color.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome \n To Medication Reminder",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: color.secondary,
                      ),
                    ),
                    Text(
                      "3 of 5 completed",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: color.secondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  "👋",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
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
            const Text(
              "Daily Review",
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              height: 8,
              thickness: 0.005,
            ),
            Expanded(
              child: ListView(
                // padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  ListTile(
                    leading: const Icon(Icons.medication),
                    title: const Text("Nugel-o"),
                    tileColor: color.onPrimary,
                    subtitle: const Text("Completed"),
                    trailing: const Icon(Icons.arrow_right_outlined),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.medication),
                    title: const Text("Nugel-o"),
                    tileColor: color.onPrimary,
                    subtitle: const Text("In-progress"),
                    trailing: const Icon(Icons.arrow_right_outlined),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.medication),
                    title: const Text("Panadol"),
                    tileColor: color.onPrimary,
                    subtitle: const Text("Completed"),
                    trailing: const Icon(Icons.arrow_right_outlined),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.medication),
                    title: const Text("Gebedol"),
                    tileColor: color.onPrimary,
                    subtitle: const Text("Completed"),
                    trailing: const Icon(Icons.arrow_right_outlined),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.medication),
                    title: const Text("Speman"),
                    tileColor: color.onPrimary,
                    subtitle: const Text("In-progress"),
                    trailing: const Icon(Icons.arrow_right_outlined),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
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
