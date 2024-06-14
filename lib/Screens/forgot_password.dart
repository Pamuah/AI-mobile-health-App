import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = "/forgot-password";

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: color.primary,
        title: Text(
          "Forgot Password",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
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
              ),
              const Divider(
                height: 30,
                thickness: 0.005,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: color.primary),
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
      ),
    );
  }
}
