import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guivana/presentation/providers/providers.dart';
import 'package:guivana/presentation/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], 
      body: const _HomeView(),
    ); 
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView(); 

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView>{
  @override
    initState(){
      super.initState();
      ref.read(popularMoviesProvider.notifier).getMovies();
    }
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(moviesLoadingProvider);
    final sliderMovies = ref.watch(moviesSliderProvider); 


    if(isLoading){
      return const FullScreenLoader();
    }

    
    return CustomScrollView(
      slivers:[
        SliverAppBar(
          backgroundColor: Colors.blueGrey[900],
          floating: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: CustomAppbar(), 
            titlePadding: EdgeInsets.all(2),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1, 
            (context, index) {
              return CustomCarousel(movies: sliderMovies);
            },
          )
        ),
      ],
    ); 
  }
} 