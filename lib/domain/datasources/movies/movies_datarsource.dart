import 'package:guivana/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getMovies({ int page = 1 });
}
