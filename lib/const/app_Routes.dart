import 'package:ai_mhealth_app/Screens/ai_model.dart';
import 'package:ai_mhealth_app/Screens/add_medication.dart';
import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/Screens/patient_records.dart';
import 'package:ai_mhealth_app/Screens/self_checkup.dart';
import 'package:ai_mhealth_app/Screens/health_tips.dart';
import 'package:ai_mhealth_app/Screens/healthreminder.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ai_mhealth_app/Screens/doctor.dart';
import '../Screens/sign_up.dart';

class AppRoutes {
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      MedicationReminderScreen.routeName: (context) =>
          const MedicationReminderScreen(),
      HealthEduScreen.routeName: (context) => const HealthEduScreen(),
      SelfCheckUpScreen.routeName: (context) => const SelfCheckUpScreen(),
      DoctorScreen.routeName: (context) => const DoctorScreen(),
      AddMedicationScreen.routeName: (context) => const AddMedicationScreen(),
      PatientRecords.routeName: (context) => const PatientRecords(),
      AiModelScreen.routeName: (context) => const AiModelScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
    };
  }
}
