import 'package:injectable/injectable.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/data/repository/biometrics_auth_repository_impl.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/data/use_case/biometrics_auth_use_case_impl.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/domain/repository/biometrics_auth_repository.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/domain/use_case/biometrics_auth_use_case.dart';
import 'package:safe_photo_comparison/feature/biometric_auth/presentation/bloc/biometric_auth_bloc.dart';

@module
abstract class BiometricAuthModule {
  @injectable
  BiometricAuthBloc get bloc;

  @LazySingleton(as: BiometricsAuthRepository)
  BiometricsAuthRepositoryImpl get repository;

  @LazySingleton(as: BiometricsAuthUseCase)
  BiometricsAuthUseCaseImpl get useCase;
}
