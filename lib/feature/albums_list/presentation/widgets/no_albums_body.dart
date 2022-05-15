import 'package:flutter/material.dart';
import 'package:safe_photo_comparison/feature/album_form/presentation/album_form_page.dart';

class NoAlbumsBody extends StatelessWidget {
  const NoAlbumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No albums. Create one now!'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AlbumFormPage(),
                ),
              ),
              child: const Text('Create album'),
            ),
          ],
        ),
      ),
    );
  }
}
