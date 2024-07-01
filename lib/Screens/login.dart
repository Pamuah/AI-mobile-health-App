import 'dart:convert';
import 'package:ai_mhealth_app/Screens/sign_up.dart';
import 'package:ai_mhealth_app/models/user.dart';
import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:ai_mhealth_app/widgets/Google_Facebook_BTN.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
  final String serverEndPoint = "http://100.112.18.254:3000/mhealth-api/users";

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final provider = Provider.of<UserData>(context, listen: false);

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
                        hintText: 'Email',
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        controller: emailController,
                        contentPadding:
                            const EdgeInsets.only(top: 5, left: 16.0),
                        obscure: false,
                        keyboard: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        hintText: ' Password',
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        controller: passwordController,
                        contentPadding:
                            const EdgeInsets.only(top: 5, left: 16.0),
                        obscure: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 25.0),
                        child: SizedBox(
                          height: 50, //
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              SystemChannels.textInput
                                  .invokeMethod<void>('TextInput.hide');
                              if (emailController.value.text.trim() == "" ||
                                  passwordController.value.text.trim() == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 25, 10, 25),
                                    duration: const Duration(
                                        seconds: 1, milliseconds: 500),
                                    margin: const EdgeInsets.only(bottom: 20),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    content: const Text(
                                        "Email or Password should not be empty"),
                                  ),
                                );
                              } else {
                                try {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (await logIn()) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 25, 10, 25),
                                          duration: const Duration(
                                              seconds: 1, milliseconds: 500),
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide(
                                              color: color.onPrimary,
                                              width: 1,
                                            ),
                                          ),
                                          content:
                                              const Text("Login Successful"),
                                        ),
                                      );
                                      Navigator.pushNamed(context, '/home');
                                    }
                                  } else {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 25, 10, 25),
                                          duration: const Duration(
                                              seconds: 1, milliseconds: 500),
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          content: const Text(
                                              "Failed to login. Wrong Passsword. Try Again!! "),
                                        ),
                                      );
                                    }
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        margin:
                                            const EdgeInsets.only(bottom: 30),
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 25, 10, 25),
                                        duration: const Duration(
                                            seconds: 1, milliseconds: 500),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        content: const Text(
                                            "Failed to login. Please enter a correct email!!"),
                                      ),
                                    );
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
                          onPressed: () {},
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
    );
  }

  // User Login
  Future<bool> logIn() async {
    final res = await http.get(
      Uri.parse("$serverEndPoint/login/${emailController.value.text}"),
    );
    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      final User user = User.fromJson(resData["userData"]);
      if (context.mounted) {
        Provider.of<UserData>(context, listen: false).getUser(user);
      }
      if (user.password == passwordController.value.text) {
        return true;
      }
      return false;
    } else {
      throw Exception("Failed to login.");
    }
  }
}
