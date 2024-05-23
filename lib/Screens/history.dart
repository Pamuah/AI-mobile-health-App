import 'package:ai_mhealth_app/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Patient History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
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
