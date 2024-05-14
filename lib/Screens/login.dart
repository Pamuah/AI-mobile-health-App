import 'package:ai_mhealth_app/widgets/Google_Facebook_BTN.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0, top: 70),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
              ),
              CustomTextField(
                  hintText: 'Email',
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  controller: emailController,
                  contentPadding: const EdgeInsets.only(top: 5, left: 16.0)),
              CustomTextField(
                  hintText: ' Password',
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  controller: passwordController,
                  contentPadding: const EdgeInsets.only(top: 5, left: 16.0)),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 25.0),
                child: Container(
                  height: 50, //
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: color.primary,
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
                  imagePath: 'assets/Google.jpg', text: 'Login with Google'),
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
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: color.onSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
