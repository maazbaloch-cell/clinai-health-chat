import 'package:flutter/material.dart';
import 'package:projectify/Forget_password.dart';
import 'package:projectify/Histroy.dart';
import 'package:projectify/OTP.dart';
import 'package:projectify/Patient.dart';
import 'package:projectify/Patient_details.dart';
import 'package:projectify/Reset_Password.dart';
import 'package:projectify/Search.dart';
import 'package:projectify/Setup_page.dart';
import 'package:projectify/Signup_page.dart';
import 'package:projectify/Splash_screen.dart';
import 'package:projectify/Tasks.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientDetails(),
    );
  }
}

