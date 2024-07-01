import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  static const resetRouteName = '/reset-success';
  static const String changeRouteName = '/password-change';

  const SuccessScreen({
    super.key,
    this.message =
        "Password was Reset Successfully. You can Log into your Account Now",
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      color: color.onPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/check.png',
              height: 200,
              width: 200,
            ),
            const Divider(
              height: 30,
              thickness: 0.001,
            ),
            RichText(
              text: TextSpan(
                text: "Success",
                style: TextStyle(
                  color: color.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
                children: [
                  TextSpan(
                    text: "\n\n$message",
                    style: TextStyle(
                      letterSpacing: 2,
                      color: color.secondary,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(
              height: 100,
              thickness: 0.001,
            ),
            CustomElevatedButton(
                text: "Continue",
                onPressed: () {
                  if (message ==
                      "Password was Reset Successfully. You can Log into your Account Now") {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  } else {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                })
          ],
        ),
      ),
    );
  }
}
