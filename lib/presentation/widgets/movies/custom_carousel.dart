import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:guivana/domain/entities/movie.dart';

class CustomCarousel extends StatelessWidget {
  final List<Movie> movies;

  const CustomCarousel({super.key, required this.movies});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        itemCount: movies.length,
        viewportFraction: 0.9,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0), 
          builder: SwiperPagination.dots,
        ),
        scale: 0.9, 
        itemBuilder: (context, index) => _Slide(movie: movies[index]),
      ),
    ); 
  }
}

class _Slide extends StatelessWidget {
  _Slide({required this.movie});
  final Movie movie;

  final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black45,
        blurRadius: 10,
        offset: Offset(0, 10),
      ),
    ],
    
  ); 


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: boxDecoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const Center(child: CircularProgressIndicator()); 
              }
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
