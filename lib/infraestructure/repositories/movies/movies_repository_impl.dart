import 'package:guivana/domain/datasources/movies/movies_datarsource.dart';
import 'package:guivana/domain/entities/movie.dart';
import 'package:guivana/domain/movies/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final MovieDatasource movieDatasource; 

  MoviesRepositoryImpl({
    required this.movieDatasource, 
  });

  @override
  Future<List<Movie>> getMovies({int page = 1}){
    return movieDatasource.getMovies(page: page);
  }

}