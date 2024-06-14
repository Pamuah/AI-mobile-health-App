import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routName = '/reset-password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool showPassword = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: color.primary,
        title: Text(
          "Reset Password",
          style: TextStyle(color: color.onPrimary, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
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
      body: SafeArea(
        child: Column(
          children: [
            const Divider(
              height: 30,
              thickness: 0.001,
            ),
            Image.asset(
              'assets/unlocked.png',
              height: 150,
              width: 150,
            ),
            RichText(
              text: TextSpan(
                text: "Enter New Password",
                style: TextStyle(
                  color: color.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
                children: [
                  TextSpan(
                    text:
                        "\n\n\nYour New Password must be different from previously used Passwords",
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
              height: 30,
              thickness: 0.001,
            ),
            CustomTextField(
              hintText: "New Password",
              controller: newPasswordController,
              contentPadding: const EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              obscure: showPassword ? false : true,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: InkWell(
                onTap: () {
                  setState(
                    () {
                      showPassword = !showPassword;
                    },
                  );
                },
                child: showPassword
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            CustomTextField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              contentPadding: const EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              obscure: showConfirm ? false : true,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: InkWell(
                onTap: () {
                  setState(
                    () {
                      showConfirm = !showConfirm;
                    },
                  );
                },
                child: showConfirm
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            const Divider(
              height: 30,
              thickness: 0.001,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: color.primary),
                child: Text(
                  "Recover Password",
                  style: TextStyle(
                      color: color.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
