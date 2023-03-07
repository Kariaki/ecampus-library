import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:ecampus_library/screens/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecampus_library/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    authController.getRoute();

    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Ecampus Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AuthScreen(),
    );
  }
}
