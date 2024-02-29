
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/infraestructure/infraestructure.dart';


final movieRepositoryProvider = Provider((ref) => MoviesRepositoryImpl(movieDatasource: MovieDbDataSource()));
