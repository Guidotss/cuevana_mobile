import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:guivana/domain/domain.dart';
import 'package:guivana/presentation/widgets/widgets.dart';

class HorizontalMovieList extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final String subTitle;
  final VoidCallback? onNextPage;

  const HorizontalMovieList({
    super.key,
    required this.movies,
    required this.title,
    required this.subTitle,
    this.onNextPage,
  });

  @override
  State<HorizontalMovieList> createState() => _HorizontalMovieListState();
}

class _HorizontalMovieListState extends State<HorizontalMovieList> {
  final ScrollController scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: _Title(title: widget.title, subTitle: widget.subTitle),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) => FadeIn(
                  child: GestureDetector(
                      onTap: () {
                        print('tap movie ${widget.movies[index].title}');
                      },
                      child: _Slide(movie: widget.movies[index]))),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String subTitle;
  const _Title({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        CustomChip(label: subTitle),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              movie.posterPath,
              width: 150,
              height: 220,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return FadeIn(child: child);

                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(
                    width: 150,
                    height: 220,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    maxLines: 10,
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
