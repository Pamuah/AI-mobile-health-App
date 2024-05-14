import 'package:flutter/material.dart';

class SelfCheckUpScreen extends StatefulWidget {
  static const routeName = '/AiModel';
  const SelfCheckUpScreen({super.key});

  @override
  State<SelfCheckUpScreen> createState() => _SelfCheckUpScreenState();
}

class _SelfCheckUpScreenState extends State<SelfCheckUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Self Checkup",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Symptoms for self checkup"),
          )
        ],
      ),
    );
  }
}
