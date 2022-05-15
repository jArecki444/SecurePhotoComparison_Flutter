import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'albums_list_event.dart';
part 'albums_list_state.dart';
part 'albums_list_bloc.freezed.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc()
      : super(
          const AlbumsState(
            pageStatus: PageStatus.noAlbums(),
          ),
        ) {
    on<LoadAlbumsEvent>(_loadAlbums);
  }

  void _loadAlbums(LoadAlbumsEvent event, Emitter<AlbumsState> emit) async {
    //TODO: Load albums from storage
    emit(
      state.copyWith(
        pageStatus: const PageStatus.albumList(),
      ),
    );
  }
}
