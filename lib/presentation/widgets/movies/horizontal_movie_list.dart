import 'package:flutter/material.dart';
import 'package:guivana/domain/domain.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<Movie> movies;
  final String title; 
  final String subTitle;
  const HorizontalMovieList({super.key, required this.movies, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 10),
            child: _Title(title: title, subTitle: subTitle),
          )
        ],
      ),
    ); 
  }
}

class _Title extends StatelessWidget {
  final String title; 
  final String subTitle; 
  const _Title({
    required this.title, 
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _CustomListViewItem extends StatelessWidget {
  const _CustomListViewItem();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
