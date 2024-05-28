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
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Notifications",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: color.secondary),
          ),
          centerTitle: true,
          leading: const SizedBox()),
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
