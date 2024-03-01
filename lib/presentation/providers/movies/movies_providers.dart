import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/domain/domain.dart';
import 'package:guivana/presentation/providers/providers.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesController, List<Movie>>((ref) {
  return MoviesController(
      fetchMovies: ref.watch(movieRepositoryProvider).getNowPlayingMovies);
});


final popularMoviesProvider = StateNotifierProvider<MoviesController, List<Movie>>(
    (ref) {
  return MoviesController(
      fetchMovies: ref.watch(movieRepositoryProvider).getPopularMovies);
});

final upcomingMoviesProvider = StateNotifierProvider<MoviesController, List<Movie>>(
    (ref) {
  return MoviesController(
      fetchMovies: ref.watch(movieRepositoryProvider).getUpcomingMovies);
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesController, List<Movie>>((ref) {
  return MoviesController(
      fetchMovies: ref.watch(movieRepositoryProvider).getTopRatedMovies);
});

typedef GetMovieCallBack = Future<List<Movie>> Function({int page});

class MoviesController extends StateNotifier<List<Movie>> {
  GetMovieCallBack fetchMovies;
  int currentPage = 0;
  bool isFetching = false;

  MoviesController({required this.fetchMovies}) : super([]);

  Future<void> getMovies() async {
    if (isFetching) return;
    isFetching = true;

    currentPage++;
    List<Movie> movies = await fetchMovies(page: currentPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 200));
    isFetching = false;
  }
}
