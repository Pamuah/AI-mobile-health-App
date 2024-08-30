import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:ai_mhealth_app/widgets/Account_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/appbar.dart';

class AccountInfoScreen extends StatelessWidget {
  static const routeName = '/account-info';

  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme;
    final String useremail =
        Provider.of<UserData>(context, listen: false).userEmail;
    final String username =
        Provider.of<UserData>(context, listen: false).userName;
    final int userid = Provider.of<UserData>(context, listen: false).userId;

    final List<String> properties = [
      "Name:",
      "ID:",
      "Email:",
      // "password",
    ];
    final List<String> values = [
      username,
      userid.toString(),
      useremail,
      // "muhammadismaaiil360@gmail.com",
      // "change",
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: MyAppBar(
          title: "Account Info",
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return AccountInfoTile(
                property: properties[index],
                value: values[index],
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 10,
              thickness: 0.001,
            ),
            itemCount: properties.length,
          ),
        ),
      ),
    );
  }
}
