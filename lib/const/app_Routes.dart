import 'dart:js';

import 'package:ai_mhealth_app/Screens/AiModel.dart';
import 'package:ai_mhealth_app/Screens/healthEdu.dart';
import 'package:ai_mhealth_app/Screens/healthreminder.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:flutter/material.dart';

import '../Screens/signUp.dart';


class App_routes{
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      LoginScreen.routeName:(context) => const LoginScreen(),
      HealthReminderScreen.routeName: (context)=> const HealthReminderScreen(),
      HealthEduScreen.routeName:(context) => const HealthEduScreen(),
      AiModelScreen.routeName:(context) => const AiModelScreen(),
    };
    }
}