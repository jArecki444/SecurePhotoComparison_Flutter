import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'albums_event.dart';
part 'albums_state.dart';
part 'albums_bloc.freezed.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc()
      : super(
          const AlbumsState(
            pageStatus: PageStatus.noAlbums(),
          ),
        ) {
    on<LoadAlbumsEvent>(_loadAlbums);
    on<CreateAlbumEvent>(_createAlbum);
    on<DeleteAlbumEvent>(_deleteAlbum);
    on<RenameAlbumEvent>(_renameAlbum);
  }

  void _loadAlbums(LoadAlbumsEvent event, Emitter<AlbumsState> emit) async {
    //TODO: Load albums from storage
    emit(
      state.copyWith(
        pageStatus: const PageStatus.albumList(),
      ),
    );
  }

  void _createAlbum(CreateAlbumEvent event, Emitter<AlbumsState> emit) async {
    //TODO: Implement create album use case
    emit(
      state.copyWith(
        pageStatus: const PageStatus.albumList(),
      ),
    );
  }

  void _deleteAlbum(DeleteAlbumEvent event, Emitter<AlbumsState> emit) async {
    //TODO: Create delete album use case
    emit(
      state.copyWith(
        pageStatus: const PageStatus.albumList(),
      ),
    );
  }

  void _renameAlbum(RenameAlbumEvent event, Emitter<AlbumsState> emit) async {
    //TODO: Create usecase to rename album
    emit(
      state.copyWith(
        pageStatus: const PageStatus.albumList(),
      ),
    );
  }
}
