import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/presentation/providers/movies/movies_providers.dart';

final moviesLoadingProvider = Provider<bool>((ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popular = ref.watch(popularMoviesProvider).isEmpty;

  if (nowPlaying || popular ) return true;

  return false;
});
