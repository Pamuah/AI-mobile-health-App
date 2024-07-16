import 'package:ai_mhealth_app/Screens/Doctor.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/Screens/sign_up.dart';
import 'package:ai_mhealth_app/const/app_routes.dart';

import 'package:ai_mhealth_app/const/theme_data.dart';
import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/medication.provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserData>(
          create: (_) => UserData(),
        ),
        ChangeNotifierProvider<MedicationData>(
          create: (_) => MedicationData(),
        ),
      ],
      child: MaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: true,
        routes: AppRoutes().getRoutes(),
        initialRoute: DoctorScreen.routeName,
        home: const DoctorScreen(),
      ),
    );
  }
}
