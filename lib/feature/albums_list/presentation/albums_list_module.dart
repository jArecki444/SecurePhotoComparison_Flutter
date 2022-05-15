import 'package:injectable/injectable.dart';

import 'bloc/albums_list_bloc.dart';

@module 
abstract class AlbumsModule {
  @injectable
  AlbumsBloc get bloc;
}