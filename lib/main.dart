import 'package:flutter/material.dart';
import 'package:myapp/skin/login.dart';
import 'package:myapp/skin/signup.dart';
import 'package:myapp/skin/welcomepage.dart';
import 'package:myapp/skin/OTPScreen.dart';
import 'package:myapp/skin/email_verivy.dart';
import 'package:myapp/skin/email_failed.dart';
import 'package:myapp/skin/enter_otp.dart';
import 'package:myapp/skin/otp_failed.dart';
import 'package:myapp/skin/verify_success.dart';
import 'package:myapp/skin/create_profile.dart';
import 'package:myapp/skin/choose_gender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChooseGenderScreen(), // Panggil halaman login di sini
    );
  }
}
