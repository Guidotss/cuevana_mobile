import 'package:guivana/domain/domain.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDatasource movieDatasource;

  MoviesRepositoryImpl({
    required this.movieDatasource,
  });

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
    return movieDatasource.getNowPlayingMovies(page: page);
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) {
    return movieDatasource.getPopularMovies(page: page);
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    return movieDatasource.getTopRatedMovies(page: page);
  }

  @override
  Future<List<Movie>> getUpcomingMovies({int page = 1}) {
    return movieDatasource.getUpcomingMovies(page: page);
  }
}
