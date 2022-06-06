import 'package:safe_photo_comparison/feature/album_form/domain/album_form_repository.dart';
import 'package:safe_photo_comparison/feature/album_form/domain/model/album.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefAlbumFormRepository extends AlbumFormRepository {
  @override
  Future<void> save(AlbumData album) async {
    final prefs = await SharedPreferences.getInstance();

    // check if album is not already created in shared preferences
    final albumAlreadyExists = prefs.getString(album.name);
    print('albumAlreadyExists: $albumAlreadyExists');

    if (albumAlreadyExists == null) {
      // save album in shared preferences
      final albumJsonRepresentation = album.toJson();
      await prefs.setString(album.name, albumJsonRepresentation.toString());
    } else {
      print('Album already exists in shared preferences $albumAlreadyExists');
    }
  }
}
