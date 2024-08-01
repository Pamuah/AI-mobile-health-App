import 'package:ai_mhealth_app/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'dart:developer';

import '../models/history.dart';
import '../services/hive_service.dart';
import '../widgets/appbar.dart';

class PatientHistoryScreen extends StatefulWidget {
  static const routeName = "/patient-history";

  const PatientHistoryScreen({super.key});

  @override
  State<PatientHistoryScreen> createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  List<String> historyHeadings = [""];
  HistoryService _historyService = HistoryService();

  Future<void> openBox() async {
    await Hive.openBox<History>('Histories');
  }

  @override
  void initState() {
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: MyAppBar(
          title: "Patient History",
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: _historyService.getAllHsitory(),
              builder: (context, snapshot) {
                final List? histories = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (histories!.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/no-file.png',
                          height: 150,
                          width: 150,
                        ),
                        Text(
                          "OOps!! You do not have any previously registered history yet.",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: color.onTertiary),
                        ),
                      ],
                    );
                  }
                  // return Text("${histories.last.date}");
                  return ValueListenableBuilder(
                    valueListenable:
                        Hive.box<History>('Histories').listenable(),
                    builder: (context, box, _) {
                      // return Text(histories[1].diagnosis);
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            var history = box.getAt(index);
                            return NotificationTile(
                                leadingIcon: Image.asset(
                                  'assets/medical-history.png',
                                  // height: 100,
                                  // width: 100,
                                ),
                                title: history!.diagnosis,
                                subTitle: history.date);
                            // return Text(history!.diagnosis);
                          },
                          separatorBuilder: (ctx, idx) => const Divider(),
                          itemCount: box.values.length);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  // Get History
  // Future<List> getHistory() async {
  //   // List<History> currentHistories = [];
  //   var box = await Hive.openBox('histories');
  //   print(box.values.toList());
  //   return box.values.toList();
  // }
}
