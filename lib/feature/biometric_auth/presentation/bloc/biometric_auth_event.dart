part of 'biometric_auth_bloc.dart';

@freezed
class BiometricAuthPageEvent with _$BiometricAuthPageEvent {
  ///This event is used after bloc initialization, to determine available biometrics options.
  const factory BiometricAuthPageEvent.setBiometricsAvailability() =
      SetBiometricsAvailabilityEvent;

  ///This event is used when user wants to authorize with biometrics.
  const factory BiometricAuthPageEvent.tryToAuthorizeWithBiometrics() =
      TryToAuthorizeWithBiometricsEvent;
}
