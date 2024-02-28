
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/infraestructure/datasources/movies/moviedb_datasource.dart';
import 'package:guivana/infraestructure/repositories/movies/movies_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) => MoviesRepositoryImpl(movieDatasource: MovieDbDataSource()));
