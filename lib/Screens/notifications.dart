import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/notification.dart';
import '../models/notification_model.dart';
import '../services/hive_service.dart';
import '../widgets/notification_tile.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = '/notifications-screen';

  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  NotifyService _notifyService = NotifyService();
  Future<void> openBox() async {
    await Hive.openBox<Notify>('notifications');
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
      appBar: AppBar(
          title: Text(
            "Notifications",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: color.secondary),
          ),
          centerTitle: true,
          leading: const SizedBox()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: NotificationService.returnPendingNotifications(),
              builder: (context, snapshot) {
                final List? notifications = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (notifications!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/no-alarm.png',
                            height: 150,
                            width: 150,
                          ),
                          Text(
                            "No Notifications yet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: color.onTertiary),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return NotificationTile(
                            leadingIcon:
                                const Icon(Icons.notifications_active_outlined),
                            title: notifications[index]!.title,
                            subTitle: notifications[index].body);
                      },
                      separatorBuilder: (ctx, idx) => const Divider(),
                      itemCount: notifications.length);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          // child: FutureBuilder(
          //     future: _notifyService.getAllNotifications(),
          //     builder: (context, snapshot) {
          //       final List? notifications = snapshot.data;
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         if (notifications!.isEmpty) {
          //           return Text("Empty");
          //         }
          //         return ValueListenableBuilder(
          //           valueListenable:
          //               Hive.box<Notify>('notifications').listenable(),
          //           builder: (context, box, _) {
          //             return ListView.separated(
          //                 itemBuilder: (context, index) {
          //                   var notification = box.getAt(index);
          //                   return NotificationTile(
          //                       leadingIcon: const Icon(
          //                           Icons.notifications_active_outlined),
          //                       title: notification!.title,
          //                       subTitle: notification.date);
          //                 },
          //                 separatorBuilder: (ctx, idx) => const Divider(),
          //                 itemCount: box.values.length);
          //           },
          //             );
          //       } else {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //     }),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     // Text(
          //     //   "No Current Notifications",
          //     //   style: TextStyle(
          //     //     fontSize: 22,
          //     //     fontWeight: FontWeight.bold,
          //     //     color: Colors.red,
          //     //   ),
          //     // ),
          //     // Icon(
          //     //   Icons.markunread_mailbox_outlined,
          //     //   size: 150,
          //     //   color: Colors.red,
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
