import 'package:ecampus_library/screens/auth/login.dart';
import 'package:ecampus_library/screens/auth/otp.dart';
import 'package:ecampus_library/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
   bool isLogIn = true;
  void toggle() => setState(() => isLogIn = !isLogIn);

  @override
  Widget build(BuildContext context) => isLogIn
      ?  LoginScreen(onClickedSignUp: toggle)
      :  SignUpScreen(onClickedSignUp: toggle);

}
