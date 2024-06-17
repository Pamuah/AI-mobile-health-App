import 'dart:convert';

import 'package:ai_mhealth_app/Screens/reset_password.dart';
import 'package:ai_mhealth_app/models/email_args.dart';
import 'package:ai_mhealth_app/widgets/otp_conatiner.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/api.dart';
import '../widgets/custom_snackbar.dart';

class ResetEmailOTPScreen extends StatefulWidget {
  static const routeName = "/reset-otp";

  const ResetEmailOTPScreen({super.key});

  @override
  State<ResetEmailOTPScreen> createState() => _ResetEmailOTPScreenState();
}

class _ResetEmailOTPScreenState extends State<ResetEmailOTPScreen> {
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
    final args = ModalRoute.of(context)!.settings.arguments as EmailArgs;
    // String email = "Kat@gmail.com";
    String email = args.email;

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
              "Email Verification",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/pin.png',
                      height: 150,
                      width: 150,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0.001,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Verification code sent to $email",
                        style: TextStyle(
                          color: color.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "\n\nPlease check the inbox or spam folder and enter the code that was sent below to Reset Password",
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
                            recognizer: TapGestureRecognizer()..onTap = () {},
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
                          try {
                            final String code = firstController.value.text +
                                secondController.value.text +
                                thirdController.value.text +
                                fourthController.value.text;

                            setState(() {
                              isLoading = true;
                            });

                            if (await verifyOtp(code)) {
                              if (context.mounted) {
                                Navigator.pushNamed(
                                  context,
                                  ResetPasswordScreen.routeName,
                                  arguments: EmailArgs(email: email),
                                );
                              }
                            } else {
                              if (context.mounted) {
                                CustomSnackbar(
                                        message: "Incorrect Code. Try Again!!",
                                        context: context)
                                    .show();
                              }
                            }
                          } catch (e) {
                            if (context.mounted) {
                              CustomSnackbar(
                                message: "Failed to Verify User $e",
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
                    ),
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
    }
    return false;
  }
}
