import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/domain/domain.dart';
import 'package:guivana/presentation/providers/providers.dart';

final popularMoviesProvider =
    StateNotifierProvider<MoviesController, List<Movie>>((ref) {
  return MoviesController(
      fetchMovies: ref.watch(movieRepositoryProvider).getNowPlayingMovies);
});

typedef GetMovieCallBack = Future<List<Movie>> Function();

class MoviesController extends StateNotifier<List<Movie>> {
  GetMovieCallBack fetchMovies;
  int currentPage = 1;
  bool isFetching = false;

  MoviesController({required this.fetchMovies}) : super([]);

  Future<void> getMovies() async {
    if (isFetching) return;
    isFetching = true;

    currentPage++;
    List<Movie> movies = await fetchMovies();
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 200));
    isFetching = false;
  }
}
