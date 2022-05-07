import 'package:injectable/injectable.dart';
import 'package:safe_photo_comparison/feature/albums/presentation/bloc/albums_bloc.dart';

@module 
abstract class AlbumsModule {
  @injectable
  AlbumsBloc get bloc;
}