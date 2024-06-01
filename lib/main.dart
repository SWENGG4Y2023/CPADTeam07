import 'package:assignment/view/home/home_view.dart';
import 'package:assignment/view/login/welcome_view.dart';
import 'package:assignment/view/main_tab/main_tab_view.dart';
import 'package:assignment/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:assignment/common/color_extension.dart';
import 'package:firebase_core/firebase_core.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MonEye',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
          surface: TColor.gray80,
          primary: TColor.primary,
          primaryContainer: TColor.gray60,
          secondary: TColor.secondary,
        ),
        useMaterial3: false,
      ),
      home: const WelcomeView(),
      // home: const MainTabView()
    );
  }
}
