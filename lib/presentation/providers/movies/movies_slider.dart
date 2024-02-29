import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/presentation/providers/providers.dart';
import 'package:guivana/domain/domain.dart';

final moviesSliderProvider = Provider<List<Movie>>((ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProvider);
  
  if(nowPlaying.isNotEmpty){
    return nowPlaying.sublist(0, 5);
  }
  return [];
}); 