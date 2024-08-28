import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/Screens/notifications.dart';
import 'package:ai_mhealth_app/Screens/privacy.dart';
import 'package:ai_mhealth_app/widgets/setting_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.provider.dart';
import '../utils/dialog.dart';
import 'account_info.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final String useremail =
        Provider.of<UserData>(context, listen: false).userEmail;
    final List<String> titles = [
      "Account",
      "Notification",
      "Privacy and Security",
      "About",
      "Logout"
    ];

    final List<IconData> icons = [
      Icons.person,
      Icons.notifications,
      Icons.lock,
      Icons.question_mark_sharp,
      Icons.logout,
    ];

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: color.primary,
          leading: const SizedBox()),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: color.primary,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: color.onPrimary,
                        letterSpacing: 1.3),
                  ),
                ),
                Text(
                  useremail,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color.onPrimary,
                      letterSpacing: 1.2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => SettingsTile(
                      icon: icons[index],
                      name: titles[index],
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(
                                context, AccountInfoScreen.routeName);
                          case 1:
                            Navigator.pushNamed(
                                context, NotificationsScreen.routeName);
                            break;
                          case 2:
                            Navigator.pushNamed(
                                context, PrivacyScreen.routeName);
                          case 4:
                            CustomDialog.showPopUp(
                                context,
                                "LOGOUT?",
                                "Are you sure you want to logout?",
                                "YES",
                                "CANCEL", () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            }, () {
                              Navigator.pop(context);
                            });

                          default:
                        }
                      },
                    ),
                separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      thickness: 1,
                      endIndent: 100,
                    ),
                itemCount: titles.length),
          )
        ],
      ),
    );
  }
}
