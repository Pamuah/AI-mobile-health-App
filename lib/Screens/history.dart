import 'package:ai_mhealth_app/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class PatientHistoryScreen extends StatefulWidget {
  static const routeName = "/patient-history";

  const PatientHistoryScreen({super.key});

  @override
  State<PatientHistoryScreen> createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  List<String> historyHeadings = [""];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: MyAppBar(
          title: "Patient History",
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   "Screen Currently Under Construction...",
            //   style: TextStyle(
            //       fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
            // ),
            // Icon(
            //   Icons.streetview_outlined,
            //   size: 150,
            //   color: Colors.red,
            // ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => NotificationTile(
                      leadingIcon: const Icon(Icons.history_edu_outlined),
                      title: "Previous Interaction with A.I...",
                      subTitle: DateTime.now().toString()),
                  separatorBuilder: (ctx, idx) => const Divider(),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
