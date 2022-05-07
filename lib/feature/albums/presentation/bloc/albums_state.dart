part of 'albums_bloc.dart';

@freezed
class AlbumsState with _$AlbumsState {
  const factory AlbumsState({
    required PageStatus pageStatus,
  }) = _AlbumsState;
}

@freezed
class PageStatus with _$PageStatus {
  const factory PageStatus.noAlbums() = _NoAlbums;
  const factory PageStatus.albumList() = _AlbumList;
  const factory PageStatus.albumDetails() = _AlbumDetails;
}