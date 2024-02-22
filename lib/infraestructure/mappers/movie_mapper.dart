

import 'package:guivana/domain/entities/movie.dart';
import 'package:guivana/infraestructure/models/moviedb_model.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB moviedb) => Movie(
    id: moviedb.id,
    title: moviedb.title,
    overview: moviedb.overview,
    releaseDate: moviedb.releaseDate,
    voteAverage: moviedb.voteAverage,
    adult: moviedb.adult,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    popularity: moviedb.popularity,
    video: moviedb.video,
    voteCount: moviedb.voteCount,
    genreIds: moviedb.genreIds, 
    posterPath: (moviedb.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'no-poster',
    backdropPath: (moviedb.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'no-backdrop'
  );  
}