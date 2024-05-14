import 'package:flutter/material.dart';

class HealthEduScreen extends StatefulWidget {
  static const routeName = '/health-education';
  const HealthEduScreen({super.key});

  @override
  State<HealthEduScreen> createState() => _HealthEduScreenState();
}

class _HealthEduScreenState extends State<HealthEduScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily Tip",
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
            Text(
              "Screen Currently Under Construction...",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Icon(
              Icons.streetview_outlined,
              size: 150,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
