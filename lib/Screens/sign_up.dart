import 'dart:convert';
import 'package:ai_mhealth_app/Screens/email_otp.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/api.dart';
import '../models/user_args.dart';
import '../widgets/custom_snackbar.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;


  bool showPassword = false;
  final String serverEndPoint = Api.userEndpoint;


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      },
      child: Scaffold(
        body: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          dismissible: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 70),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: color.secondary),
                    ),
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.person_outlined),
                    suffixIcon: null,
                    hintText: 'Name',
                    controller: nameController,
                    contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                    obscure: false,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: null,
                    hintText: 'Email',
                    controller: emailController,
                    contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                    obscure: false,
                    keyboard: TextInputType.emailAddress,
                  ),
                  CustomTextField(
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
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                    ),
                    hintText: ' Password',
                    controller: passwordController,
                    contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                    obscure: showPassword ? false : true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'The password should be at least 6 characters long',
                      style: TextStyle(
                          color: color.onTertiary,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: SizedBox(
                      height: 50, //
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          SystemChannels.textInput
                              .invokeMethod<void>('TextInput.hide');
                          if (nameController.value.text.trim() == "" ||
                              emailController.value.text.trim() == "" ||
                              passwordController.value.text.trim() == "") {
                            CustomSnackbar(
                              message: "Fill out all Fields",
                              context: context,
                              color: Colors.red.shade200,
                            ).show();
                          } else {
                            try {
                              setState(() {
                                isLoading = true;
                              });
                              if (await sendOtp()) {
                                if (context.mounted) {
                                  Navigator.pushNamed(
                                      context, EmailOtpScreen.routeName,
                                      arguments: UserArgs(
                                        name: nameController.value.text,
                                        email: emailController.value.text,
                                        password: passwordController.value.text,
                                      ));
                                }
                              } else {
                                if (context.mounted) {
                                  CustomSnackbar(
                                    message: "Check Connection and Try Again!!",
                                    context: context,
                                  ).show();
                                }
                              }
                            } catch (e) {
                              if (context.mounted) {
                                CustomSnackbar(
                                  message: "Check Connection and Try Again $e",
                                  context: context,
                                ).show();
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: color.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      children: [
                        Container(
                          height: 1.0,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: color.tertiary,
                            ),
                          ),
                        ),
                        Container(
                          height: 1.0,
                          width: MediaQuery.of(context).size.width * 0.35,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: color.onSurface, width: 1.0),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Google.jpg',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                      color: color.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: color.onSurface, width: 1.0),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/facebook.jpg',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                    color: color.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> sendOtp() async {
    String email = emailController.value.text;
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
