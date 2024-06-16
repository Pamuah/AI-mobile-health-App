import 'dart:convert';

import 'package:ai_mhealth_app/Screens/email_otp.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/email_args.dart';
import 'reset_email_otp.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = "/forgot-password";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;
  final String serverEndPoint = "http://localhost:3000/mhealth-api/users";

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      },
      child: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        dismissible: false,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: color.primary,
            title: Text(
              "Forgot Password",
              style: TextStyle(
                  color: color.onPrimary, fontWeight: FontWeight.w700),
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(
                      height: 30,
                      thickness: 0.001,
                    ),
                    Image.asset(
                      'assets/forgot.png',
                      height: 150,
                      width: 150,
                    ),
                    const Divider(
                      height: 30,
                      thickness: 0.001,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Mail Address Here",
                        style: TextStyle(
                          color: color.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "\n\nEnter the Email Address you used to Register your Account",
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
                    CustomTextField(
                      hintText: "Email",
                      controller: controller,
                      contentPadding: const EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      obscure: false,
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: const SizedBox(),
                      keyboard: TextInputType.emailAddress,
                    ),
                    const Divider(
                      height: 30,
                      thickness: 0.005,
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          SystemChannels.textInput
                              .invokeMethod<void>('TextInput.hide');
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            if (await sendOtp()) {
                              if (context.mounted) {
                                Navigator.pushNamed(
                                  context,
                                  ResetEmailOTPScreen.routeName,
                                  arguments: EmailArgs(
                                    email: controller.value.text.trim(),
                                  ),
                                );
                              }
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 25, 10, 25),
                                    duration: const Duration(
                                        seconds: 1, milliseconds: 500),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    content: const Text(
                                        "Check Connection and Try Again"),
                                  ),
                                );
                              }
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 25, 10, 25),
                                  duration: const Duration(
                                      seconds: 1, milliseconds: 500),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content:
                                      Text("Check Connection and Try Again $e"),
                                ),
                              );
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color.primary),
                        child: Text(
                          "Recover Password",
                          style: TextStyle(
                              color: color.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ResetEmailOTPScreen.routeName,
                          arguments:
                              EmailArgs(email: controller.value.text.trim()),
                        );
                      },
                      child: Text(
                        "Test",
                        style: TextStyle(
                            color: color.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, LoginScreen.routeName);
                    //   },
                    //   child: Text(
                    //     "Click",
                    //     style: TextStyle(color: color.secondary),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> sendOtp() async {
    String email = controller.value.text.trim();
    final res = await http.post(
      Uri.parse("$serverEndPoint/send-otp"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {"email": email},
      ),
    );
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
