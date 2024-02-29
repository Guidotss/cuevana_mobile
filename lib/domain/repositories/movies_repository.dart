import 'package:guivana/domain/domain.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayingMovies({int page = 1}); 
}