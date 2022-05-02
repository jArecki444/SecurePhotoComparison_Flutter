part of 'biometric_auth_bloc.dart';

@freezed
class BiometricAuthEvent with _$BiometricAuthEvent {
  ///This event is used after bloc initialization, to determine available biometrics options.
  const factory BiometricAuthEvent.setBiometricsAvailability() =
      SetBiometricsAvailabilityEvent;

  ///This event is used when user wants to authorize with biometrics.
  const factory BiometricAuthEvent.tryToAuthorizeWithBiometrics() =
      TryToAuthorizeWithBiometricsEvent;
}
