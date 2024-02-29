import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/presentation/providers/providers.dart';
import 'package:guivana/domain/domain.dart';

final moviesSliderProvider = Provider<List<Movie>>((ref) {
  final popular = ref.watch(popularMoviesProvider);
  
  if(popular.isNotEmpty){
    return popular.sublist(0, 5);
  }
  return [];
}); 