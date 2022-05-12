import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_photo_comparison/core/dependency_injection.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/presentation/biometric_auth_page.dart';

void main() {
  // Configure dependency injection.
  configureDependencies(const Environment('dev'));

  //Wrap runApp with BlocOverrides to support BlocDevTools.
  BlocOverrides.runZoned(() async => runApp(const MyApp()),
      blocObserver: BlocTransitionObserver());
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

class BlocTransitionObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(
        'BLOC LOGGER - ${bloc.runtimeType} - CURRENT STATE -  ${transition.currentState}',
      );
      print(
        'BLOC LOGGER - ${bloc.runtimeType} - STATE CHANGED TO - ${transition.nextState}',
      );
    }
  }
}
