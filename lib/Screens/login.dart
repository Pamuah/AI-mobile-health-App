import 'dart:convert';
import 'package:ai_mhealth_app/Screens/forgot_password.dart';
import 'package:ai_mhealth_app/Screens/sign_up.dart';
import 'package:ai_mhealth_app/models/user.dart';
import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:ai_mhealth_app/widgets/Google_Facebook_BTN.dart';
import 'package:ai_mhealth_app/utils/custom_snackbar.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/api.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  bool showPassword = false;
  final String userEndPoint = Api.userEndpoint;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String message = 'message';
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    // final provider = Provider.of<UserData>(context, listen: false);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          dismissible: false,
          child: GestureDetector(
            onTap: () {
              SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
            },
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0, top: 70),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: color.secondary),
                          ),
                        ),
                        CustomTextField(
                          prefixIcon: const Icon(Icons.email_outlined),
                          suffixIcon: null,
                          hintText: 'Email',
                          controller: emailController,
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 16.0),
                          obscure: false,
                          keyboard: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          prefixIcon: const Icon(Icons.key_outlined),
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
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 16.0),
                          obscure: showPassword ? false : true,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20.0, top: 25.0),
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                SystemChannels.textInput
                                    .invokeMethod<void>('TextInput.hide');
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                } else {
                                  // print(message);
                                  try {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (await logIn()) {
                                      if (context.mounted) {
                                        // CustomSnackbar(
                                        //         message: "Login Successful",
                                        //         context: context)
                                        //     .show();
                                        Navigator.pushNamed(context, '/home');
                                      }
                                    }
                                    print(message);
                                    if (context.mounted) {
                                      CustomSnackbar(
                                              message: message,
                                              context: context)
                                          .show();
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      CustomSnackbar(
                                              message: e.toString(),
                                              context: context)
                                          .show();
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
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: color.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: color.onSecondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        const GoogleFacebook_btn(
                            imagePath: 'assets/Google.jpg',
                            text: 'Login with Google'),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: GoogleFacebook_btn(
                              imagePath: 'assets/facebook.jpg',
                              text: 'Login with Facebook'),
                        ),
                        Row(
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(
                                  color: color.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: color.onSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // User Login
  Future<bool> logIn() async {
    final String email = emailController.value.text;
    final String password = passwordController.value.text;
    try {
      final res = await http.get(
        Uri.parse("$userEndPoint/login/$email/$password"),
      );
      // print(res.body);
      final resData = jsonDecode(res.body);
      if (res.statusCode == 200) {
        // print(resData);
        final User user = User.fromJson(resData[0]);
        if (context.mounted) {
          Provider.of<UserData>(context, listen: false).getUser(user);
        }
        message = "login successful";
        return true;
      }
      print(resData['message']);
      message = resData["message"];
    } catch (e) {
      // message = e.toString();
      rethrow;
    }
    return false;
  }
}
