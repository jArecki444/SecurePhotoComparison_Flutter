part of 'albums_list_bloc.dart';

@freezed
class AlbumsEvent with _$AlbumsEvent {
  const factory AlbumsEvent.loadAlbums() = LoadAlbumsEvent;
  const factory AlbumsEvent.createAlbum() = CreateAlbumEvent;
  const factory AlbumsEvent.deleteAlbum() = DeleteAlbumEvent;
  const factory AlbumsEvent.renameAlbum() = RenameAlbumEvent;
  const factory AlbumsEvent.showAlbumDetails() = ShowAlbumDetailsEvent;
}