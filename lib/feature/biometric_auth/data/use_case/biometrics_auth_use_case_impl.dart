import 'package:safe_photo_comparison/feature/biometric_auth/domain/repository/biometrics_auth_repository.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/domain/use_case/biometrics_auth_use_case.dart';

class BiometricsAuthUseCaseImpl extends BiometricsAuthUseCase {
  final BiometricsAuthRepository _biometricsRepository;

  BiometricsAuthUseCaseImpl(this._biometricsRepository);

  @override
  Future<bool> authenticateWithBiometrics() async {
    return await _biometricsRepository.authenticateWithBiometrics();
  }

  @override
  Future<List<String>> getAvailableBiometrics() async {
    return await _biometricsRepository.getAvailableBiometrics();
  }

  @override
  Future<bool> hasBiometricsEnabled() async {
    final biometricsSupportedOnDevice =
        await _biometricsRepository.hasBiometrics();
    final availableBiometricsOptions =
        await _biometricsRepository.getAvailableBiometrics();
    return biometricsSupportedOnDevice && availableBiometricsOptions.isNotEmpty;
  }

  @override
  Future<UnavailableBiometricsReason> getUnavailableBiometricsReason() async {
    final biometricsSupportedOnDevice =
        await _biometricsRepository.hasBiometrics();
    final availableBiometricsOptions =
        await _biometricsRepository.getAvailableBiometrics();

    return biometricsSupportedOnDevice && availableBiometricsOptions.isEmpty
        ? UnavailableBiometricsReason.biometricsNotConfigured
        : UnavailableBiometricsReason.biometricsNotSupportedOnDevice;
  }
}
