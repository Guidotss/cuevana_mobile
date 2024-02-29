import 'package:dio/dio.dart';
import 'package:guivana/config/constants/envs_variables.dart';
import 'package:guivana/domain/domain.dart'; 
import 'package:guivana/infraestructure/infraestructure.dart';


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
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    try {
      final response =
          await dio.get('/movie/now_playing', queryParameters: {
            'page': page, 
          });

      return _jsonToMovie(response.data);
    } catch (error) {
      throw Exception('Error al obtener las peliculas $error');
    }
  }
}
