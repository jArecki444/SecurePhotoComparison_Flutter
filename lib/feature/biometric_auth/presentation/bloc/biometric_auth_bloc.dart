import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/domain/use_case/biometrics_auth_use_case.dart';

part 'biometric_auth_event.dart';
part 'biometric_auth_state.dart';
part 'biometric_auth_bloc.freezed.dart';

class BiometricAuthBloc extends Bloc<BiometricAuthEvent, BiometricAuthState> {
  final BiometricsAuthUseCase _biometricsUseCase;

  BiometricAuthBloc(this._biometricsUseCase)
      : super(
          const BiometricAuthState(
            availableBiometricsOptions: [],
            pageStatus: PageStatus.checkingBiometricsAvailability(),
          ),
        ) {
    on<SetBiometricsAvailabilityEvent>(_setBiometricsAvailability);
    on<TryToAuthorizeWithBiometricsEvent>(_tryToAuthorizeWithBiometrics);
  }

  void _setBiometricsAvailability(SetBiometricsAvailabilityEvent event,
      Emitter<BiometricAuthState> emit) async {
    final hasBiometricsEnabled =
        await _biometricsUseCase.hasBiometricsEnabled();

    //Check if biometric auth is supported on device and ready to use
    if (hasBiometricsEnabled) {
      final availableBiometrics =
          await _biometricsUseCase.getAvailableBiometrics();
      emit(
        state.copyWith(
          pageStatus: const PageStatus.waitingForSelectionOfAuthMethod(),
          availableBiometricsOptions: availableBiometrics,
        ),
      );
    } else {
      final unavailableBiometricsReason =
          await _biometricsUseCase.getUnavailableBiometricsReason();
      emit(
        state.copyWith(
          pageStatus: PageStatus.biometricsUnavailable(
            reason: unavailableBiometricsReason,
          ),
        ),
      );
    }
  }

  void _tryToAuthorizeWithBiometrics(TryToAuthorizeWithBiometricsEvent event,
      Emitter<BiometricAuthState> emit) async {
    final isAuthorized = await _biometricsUseCase.authenticateWithBiometrics();

    emit(
      state.copyWith(
        pageStatus: isAuthorized
            ? const PageStatus.authorized()
            : const PageStatus.unauthorized(),
      ),
    );
  }
}
