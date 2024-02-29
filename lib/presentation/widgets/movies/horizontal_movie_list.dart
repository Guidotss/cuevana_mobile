import 'package:flutter/material.dart';
import 'package:guivana/domain/domain.dart';

class HorizontalMovieList extends StatelessWidget {
  final String title; 
  final List<Movie> movies; 
  const HorizontalMovieList({
    super.key, 
    required this.title, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: 280.0,
      width: double.infinity,
      child: ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Placeholder(),
      ),
    ); 
  }
}   