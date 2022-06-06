import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';

part 'album.g.dart';

@freezed
class AlbumData with _$AlbumData {
  const factory AlbumData({
    required String name,
    required String pathOfBeforeImage,
    required String pathOfAfterImage,
  }) = _AlbumData;

  factory AlbumData.fromJson(Map<String, dynamic> json) =>
      _$AlbumDataFromJson(json);
}
