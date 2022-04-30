import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/domain/repository/biometrics_auth_repository.dart';

class BiometricsAuthRepositoryImpl extends BiometricsAuthRepository {
  final _auth = LocalAuthentication();

  @override
  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Use one of available authentication methods',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: false,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  Future<List<String>> getAvailableBiometrics() async {
    try {
      final biometricTypes = await _auth.getAvailableBiometrics();
      return biometricTypes.map((type) => type.toString()).toList();
    } on PlatformException catch (_) {
      return [];
    }
  }
}
