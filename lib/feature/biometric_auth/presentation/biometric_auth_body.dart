import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_photo_comparison/feature/albums_list/presentation/albums_list_page.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/domain/use_case/biometrics_auth_use_case.dart';

import 'bloc/biometric_auth_bloc.dart';

class BiometricAuthBody extends StatelessWidget {
  const BiometricAuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BiometricAuthBloc, BiometricAuthState>(
      listener: (context, state) {
        state.pageStatus.maybeWhen(
          orElse: () {},
          authorized: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AlbumsPage(),
            ),
          ),
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: state.pageStatus.maybeWhen(
              waitingForSelectionOfAuthMethod: () {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.read<BiometricAuthBloc>().add(
                              const BiometricAuthEvent
                                  .tryToAuthorizeWithBiometrics(),
                            ),
                        child: const Text('Authorize with biometrics'),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Debug info - Available biometrics options: ${state.availableBiometricsOptions}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
              checkingBiometricsAvailability: () => const Center(
                child: CircularProgressIndicator(),
              ),
              unauthorized: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Unauthorized'),
                    ElevatedButton(
                      onPressed: () => context.read<BiometricAuthBloc>().add(
                            const BiometricAuthEvent
                                .tryToAuthorizeWithBiometrics(),
                          ),
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              ),
              biometricsUnavailable: (UnavailableBiometricsReason reason) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Biometrics unavailable'),
                      const SizedBox(height: 16),
                      Text(
                        getBiometricsUnavailabilityReasonText(reason),
                      ),
                    ],
                  ),
                );
              },
              orElse: () {}
            ),
          ),
        );
      },
    );
  }
}

String getBiometricsUnavailabilityReasonText(
    UnavailableBiometricsReason reason) {
  switch (reason) {
    case UnavailableBiometricsReason.biometricsNotSupportedOnDevice:
      return 'Biometrics are not supported on this device.';
    case UnavailableBiometricsReason.biometricsNotConfigured:
      return 'Biometrics are not configured. Please check your device settings.';
  }
}
