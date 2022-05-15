import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_photo_comparison/core/dependency_injection.dart';

import 'albums_list_body.dart';
import 'bloc/albums_list_bloc.dart';

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
