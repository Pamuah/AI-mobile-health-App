import 'dart:convert';

import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/models/user_args.dart';
import 'package:ai_mhealth_app/widgets/otp_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

import '../models/api.dart';
import '../widgets/appbar.dart';
import '../utils/custom_snackbar.dart';

class EmailOtpScreen extends StatefulWidget {
  static const routeName = '/otp';

  const EmailOtpScreen({super.key});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  bool isLoading = false;
  final String serverEndPoint = Api.userEndpoint;

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final args = ModalRoute.of(context)!.settings.arguments as UserArgs?;
    final String? name = args?.name;
    final String? email = args?.email;
    final String? password = args?.password;

    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      },
      child: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        dismissible: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 70),
            child: MyAppBar(
              title: "Account Verification",
              onPressed: () {},
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const Divider(
                      height: 60,
                      thickness: 0.005,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Verification code sent to $email",
                        style: TextStyle(
                          color: color.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "\n\n\nPlease check the inbox or spam folder and enter the code that was sent below to complete Registration",
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
                      thickness: 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpContainer(controller: firstController),
                        OtpContainer(
                          controller: secondController,
                        ),
                        OtpContainer(
                          controller: thirdController,
                        ),
                        OtpContainer(
                          controller: fourthController,
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0.005,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Didn't recieve code?? ",
                        style: TextStyle(
                          color: color.secondary,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: TextStyle(
                              color: color.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
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
                          try {
                            final String code = firstController.value.text +
                                secondController.value.text +
                                thirdController.value.text +
                                fourthController.value.text;

                            setState(() {
                              isLoading = true;
                            });

                            if (await verifyOtp(code)) {
                              try {
                                if (await addUser(name, email, password)) {
                                  if (context.mounted) {
                                    CustomSnackbar(
                                            message: "Registration Successful",
                                            context: context)
                                        .show();
                                    Navigator.pushNamed(
                                        context, LoginScreen.routeName);
                                  }
                                } else {
                                  if (context.mounted) {
                                    CustomSnackbar(
                                      message: "User Registration Failed",
                                      context: context,
                                    ).show();
                                  }
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  CustomSnackbar(
                                    message: "User Registration Failed $e",
                                    context: context,
                                  ).show();
                                }
                              }
                            } else {
                              if (context.mounted) {
                                CustomSnackbar(
                                  message: "Incorrect Code. Try Again!!",
                                  context: context,
                                ).show();
                              }
                            }
                          } catch (e) {
                            if (context.mounted) {
                              CustomSnackbar(
                                message: "User verification Failed $e",
                                context: context,
                              ).show();
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color.primary),
                        child: Text(
                          "Verify and Proceed",
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
            ),
          ),
        ),
      ),
    );
  }

  // Verify OTP code
  Future<bool> verifyOtp(code) async {
    final res = await http.post(
      Uri.parse("$serverEndPoint/verify-otp"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "code": code,
        },
      ),
    );
    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      final String verified = resData['verified'];
      if (verified == "true") {
        return true;
      }
      return false;
    } else {
      throw Exception("Failed to login.");
    }
  }

  // Register User
  Future<bool> addUser(name, email, password) async {
    Map<String, String> user = {
      'name': name,
      'email': email,
      'password': password,
    };

    final res = await http.post(
      Uri.parse("$serverEndPoint/register"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user),
    );
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
