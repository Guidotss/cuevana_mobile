
import 'package:guivana/domain/datasources/movies/movies_datarsource.dart';
import 'package:guivana/domain/entities/movie.dart';

class MovieDbDataSource implements MovieDatasource {
  @override
  Future<List<Movie>> getMovies({ int page = 1 }) {
    // TODO: implement getMovies
    throw UnimplementedError();
  }

}