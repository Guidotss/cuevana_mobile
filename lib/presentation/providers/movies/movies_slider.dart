import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/domain/entities/movie.dart';
import 'package:guivana/presentation/providers/providers.dart';

final moviesSliderProvider = Provider<List<Movie>>((ref) {
  final popular = ref.watch(popularMoviesProvider.notifier).state;

  print(popular); 
  
  if(popular.isNotEmpty){
    return popular.sublist(0, 5);
  }
  return [];
}); 