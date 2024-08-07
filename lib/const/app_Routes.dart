import 'package:ai_mhealth_app/Screens/Splash.dart';
import 'package:ai_mhealth_app/Screens/account_info.dart';
import 'package:ai_mhealth_app/Screens/ai_model.dart';
import 'package:ai_mhealth_app/Screens/add_medication.dart';
import 'package:ai_mhealth_app/Screens/email_otp.dart';
import 'package:ai_mhealth_app/Screens/forgot_password.dart';
import 'package:ai_mhealth_app/Screens/history.dart';
import 'package:ai_mhealth_app/Screens/home.dart';
import 'package:ai_mhealth_app/Screens/notifications.dart';
import 'package:ai_mhealth_app/Screens/password_verification.dart';
import 'package:ai_mhealth_app/Screens/patient_records.dart';
import 'package:ai_mhealth_app/Screens/prediction.dart';
import 'package:ai_mhealth_app/Screens/privacy.dart';
import 'package:ai_mhealth_app/Screens/reset_email_otp.dart';
import 'package:ai_mhealth_app/Screens/reset_password.dart';
import 'package:ai_mhealth_app/Screens/self_checkup.dart';
import 'package:ai_mhealth_app/Screens/health_tips.dart';
import 'package:ai_mhealth_app/Screens/healthreminder.dart';
import 'package:ai_mhealth_app/Screens/login.dart';
import 'package:ai_mhealth_app/Screens/settings.dart';
import 'package:ai_mhealth_app/Screens/success.dart';
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
      NotificationsScreen.routeName: (context) => const NotificationsScreen(),
      SettingsScreen.routeName: (context) => const SettingsScreen(),
      PatientHistoryScreen.routeName: (context) => const PatientHistoryScreen(),
      EmailOtpScreen.routeName: (context) => const EmailOtpScreen(),
      ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
      ResetEmailOTPScreen.routeName: (context) => const ResetEmailOTPScreen(),
      ResetPasswordScreen.resetRouteName: (context) =>
          const ResetPasswordScreen(),
      ResetPasswordScreen.changeRouteName: (context) =>
          const ResetPasswordScreen(
            buttonText: "Change Password",
            routeTo: SuccessScreen.changeRouteName,
          ),
      AccountInfoScreen.routeName: (context) => const AccountInfoScreen(),
      PrivacyScreen.routeName: (context) => const PrivacyScreen(),
      PasswordVerificationScreen.routeName: (context) =>
          const PasswordVerificationScreen(),
      SuccessScreen.resetRouteName: (context) => const SuccessScreen(),
      SuccessScreen.changeRouteName: (context) => const SuccessScreen(
          message: "Password was Successfully Changed. Proceed To Home Screen"),

      SplashScreen.routeName: (context) => const SplashScreen(),
      PredictionScreen.routeName: (ctx) => const PredictionScreen()
    };
  }
}
