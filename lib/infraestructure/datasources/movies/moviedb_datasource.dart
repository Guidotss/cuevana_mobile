import 'package:dio/dio.dart';
import 'package:guivana/config/constants/envs_variables.dart';
import 'package:guivana/domain/datasources/movies/movies_datarsource.dart';
import 'package:guivana/domain/entities/movie.dart';
import 'package:guivana/infraestructure/mappers/movie_mapper.dart';
import 'package:guivana/infraestructure/models/moviedb_response.dart';

class MovieDbDataSource implements MovieDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': EnvsVariables.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((movie) =>
            movie.posterPath != 'no-poster' &&
            movie.backdropPath != 'no-backdrop')
        .map((movie) => MovieMapper.movieDbToEntity(movie))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response =
          await dio.get('/movie/popular', queryParameters: {
            'page': page, 
          });

      return _jsonToMovie(response.data);
    } catch (error) {
      throw Exception('Error al obtener las peliculas $error');
    }
  }
}
