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
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: MyAppBar(
          title: "Privacy",
          onPressed: () {},
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
