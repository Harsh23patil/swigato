import 'package:flutter/material.dart';
import 'package:swigato/core/theme/theme.dart';
import 'package:swigato/features/auth/presentation/pages/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Blog App',
      theme: AppTheme.lightThemeMode,
      home: SignUp(),
    );
  }
}

