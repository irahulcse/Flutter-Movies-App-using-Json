import 'package:flutter/material.dart';
import 'package:flutter_movies_application/movie.dart';

class MovieDetailsHeaderwithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderwithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Row(
        children: [
          MoviePoster(
            poster: movie.images[0].toString(),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  final Movie movie;

  const MoviePoster({Key key, this.poster, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(12);
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(poster),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Flexible(
              child: Expanded(
                // child: MovieDetailsHeader(movie: movie),
                child: Column(
                  children: [
                    Text(
                      // "${movie.director}. ${movie.genre.toUpperCase()}",

                      "Good to Go",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${movie.year}. ${movie.genre.toUpperCase()}",
        ),
      ],
    );
  }
}
