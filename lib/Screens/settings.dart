import 'package:ai_mhealth_app/widgets/setting_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final String useremail =
        Provider.of<UserData>(context, listen: false).useremail;
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
        leading: Container(
          height: 55,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.primary,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: color.onPrimary,
            ),
          ),
        ),
      ),
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
                      onTap: () {},
                    ),
                separatorBuilder: (context, index) => const Divider(
                      height: 5,
                      thickness: 0.001,
                    ),
                itemCount: titles.length),
          )
        ],
      ),
    );
  }
}
