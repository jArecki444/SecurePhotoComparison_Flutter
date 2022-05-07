import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_photo_comparison/feature/albums/presentation/bloc/albums_bloc.dart';

class AlbumsBody extends StatelessWidget {
  const AlbumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AlbumsBloc, AlbumsState>(
        builder: (context, state) {
          return Center(
            child: state.pageStatus.maybeMap(
              albumDetails: (_) => const Text('Album details'),
              albumList: (_) => const Text('Album list'),
              noAlbums: (_) => const Text('No albums'),
              orElse: () {},
            ),
          );
        },
      ),
    );
  }
}
