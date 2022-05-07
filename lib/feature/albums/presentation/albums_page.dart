import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_photo_comparison/core/dependency_injection.dart';
import 'package:safe_photo_comparison/feature/albums/presentation/albums_body.dart';
import 'package:safe_photo_comparison/feature/albums/presentation/bloc/albums_bloc.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<AlbumsBloc>(),
      child: const AlbumsBody(),
    );
  }
}
