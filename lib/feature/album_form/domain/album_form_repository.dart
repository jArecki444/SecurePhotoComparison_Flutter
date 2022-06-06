import 'package:safe_photo_comparison/feature/album_form/domain/model/album.dart';

abstract class AlbumFormRepository {
  Future<void> save(AlbumData album);
}