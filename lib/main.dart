import 'dart:js';

import 'package:ai_mhealth_app/const/app_Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
   [ DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  ).then((_){
    runApp(DevicePreview(
      enabled: true,
      builder: (context)=>MyApp(),
    ));
  });
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: App_routes().getRoutes(),
    
    );
  }}