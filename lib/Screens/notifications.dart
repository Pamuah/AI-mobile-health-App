import 'package:flutter/material.dart';

import '../widgets/notification_tile.dart';

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Text(
            //   "No Current Notifications",
            //   style: TextStyle(
            //     fontSize: 22,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.red,
            //   ),
            // ),
            // Icon(
            //   Icons.markunread_mailbox_outlined,
            //   size: 150,
            //   color: Colors.red,
            // ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return NotificationTile(
                      leadingIcon:
                          const Icon(Icons.notifications_active_outlined),
                      title: "You have a new notification",
                      subTitle: DateTime.now().toString(),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
