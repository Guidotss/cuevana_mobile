import 'package:guivana/domain/domain.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final MovieDatasource movieDatasource; 

  MoviesRepositoryImpl({
    required this.movieDatasource, 
  });

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}){
    return movieDatasource.getNowPlayingMovies(page: page);
  }

}