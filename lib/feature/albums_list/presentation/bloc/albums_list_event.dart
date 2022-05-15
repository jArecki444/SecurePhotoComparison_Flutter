part of 'albums_list_bloc.dart';

@freezed
class AlbumsEvent with _$AlbumsEvent {
  const factory AlbumsEvent.loadAlbums() = LoadAlbumsEvent;
}