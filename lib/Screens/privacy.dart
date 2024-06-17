import 'package:ai_mhealth_app/Screens/reset_password.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import 'password_verification.dart';

class PrivacyScreen extends StatelessWidget {
  static const String routeName = "/privacy-and-security";
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: MyAppBar(
          title: "Privacy",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            leading: const Icon(Icons.key_outlined),
            title: const Text("Change Password"),
            titleTextStyle: TextStyle(color: color.secondary, fontSize: 18),
            onTap: () {
              Navigator.pushNamed(
                  context, PasswordVerificationScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
