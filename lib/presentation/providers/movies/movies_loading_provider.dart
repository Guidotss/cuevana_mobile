import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/presentation/providers/movies/movies_providers.dart';

final moviesLoadingProvider = Provider<bool>((ref) {
  final popular = ref.watch(popularMoviesProvider).isEmpty;

  if (popular) return true;

  return false;
});
