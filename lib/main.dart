import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/Screens/sign_up.dart';
import 'package:ai_mhealth_app/const/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ai_mhealth_app/const/app_Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes().getRoutes(),
      initialRoute: '/',
      home: const SignUpScreen(),
    );
  }
}
