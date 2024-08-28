
import 'package:ai_mhealth_app/Screens/Doctor.dart';
import 'package:ai_mhealth_app/Screens/Splash.dart';
import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/Screens/sign_up.dart';
import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/const/app_routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:ai_mhealth_app/const/theme_data.dart';
import 'package:ai_mhealth_app/providers/user.provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/history.dart';
import 'models/notification.dart';
import 'models/notification_model.dart';
import 'providers/medication.provider.dart';
import 'services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  NotificationService.init();
  // To intialise the hive database
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryAdapter());
  Hive.registerAdapter(NotifyAdapter());
  // clear local databases
  void clearLocalStorage() async {
    HistoryService _historyService = HistoryService();
    await NotificationService.cancelAllNotifications();
    await _historyService.deleteAllHistory();
  }

  // Clear local databases
  // clearLocalStorage();

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
        theme: themeData(context),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes().getRoutes(),

        // initialRoute: LoginScreen.routeName,
        home: const HomeScreen(),

      ),
    );
  }
}
