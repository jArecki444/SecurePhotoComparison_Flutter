import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_photo_comparison/core/dependency_injection.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/presentation/biometric_auth_body.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/presentation/bloc/biometric_auth_bloc.dart';

class BiometricAuthPage extends StatelessWidget {
  const BiometricAuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<BiometricAuthBloc>()
        ..add(
          const BiometricAuthEvent.setBiometricsAvailability(),
        ),
      child: const BiometricAuthBody(),
    );
  }
}
