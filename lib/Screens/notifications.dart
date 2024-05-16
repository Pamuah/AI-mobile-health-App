import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = '/notifications-screen';

  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
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
      body: const SafeArea(
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
