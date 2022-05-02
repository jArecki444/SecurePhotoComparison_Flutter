import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_photo_comparison/core/dependency_injection.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/presentation/biometric_auth_page.dart';

void main() {
  // Configure dependency injection.
  configureDependencies(const Environment('dev'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Photo Comparison',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.dark,
      ),
      home: const BiometricAuthPage(),
    );
  }
}
