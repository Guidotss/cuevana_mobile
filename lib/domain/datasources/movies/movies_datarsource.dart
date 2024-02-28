import 'package:guivana/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getPopularMovies({ int page = 1 });
}
