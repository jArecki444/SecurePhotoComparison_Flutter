abstract class BiometricsAuthRepository {
  /// Returns true if device is capable of checking biometrics
  Future<bool> hasBiometrics();

  /// Authenticates the user with biometrics
  /// Returns true if the user is successfully authenticated
  Future<bool> authenticateWithBiometrics();

  /// Returns a list of available biometrics methods (fingerprint, face recognition)
  Future<List<String>> getAvailableBiometrics();
}
