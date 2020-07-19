import 'package:flutter/material.dart';
import 'package:flutter_movies_application/movie.dart';
import 'package:flutter_movies_application/movie_details_header.dart';

class MoviesListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Jai Ho",
    "Good to Go",
    "Make thing happend",
    "Jai Ho",
    "Good to Go",
    "Make thing happend",
    "Jai Ho",
    "Good to Go",
    "Make thing happend",
    "Jai Ho",
    "Good to Go",
    "Make thing happend",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Application"),
        backgroundColor: Colors.blueGrey.shade700,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade700,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              movieCard(movieList[index], context),
              Positioned(
                top: 10,
                child: movieImage(movieList[index].images[0]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 50),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.white38,
          child: Padding(
            padding: EdgeInsets.only(
              top: 18,
              bottom: 12,
              left: 54,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 12,
                right: 12,
                left: 12,
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Rating ${movie.imdbRating}/10",
                          style: mainTextStyle(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Released:${movie.released}",
                          style: mainTextStyle(),
                        ),
                        Text(
                          "Released:${movie.runtime}",
                          style: mainTextStyle(),
                        ),
                        Text(
                          "Released:${movie.rated}",
                          style: mainTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviesListViewDetails(
              movieName: movie.title,
              movie: movie,
            ),
          ),
        );
      },
    );
  }

//
  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
            imageUrl ?? 'http://lorempixel.com/640/480',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }
}

//New Route (screen or page in flutter)
//Page's in Flutter where we can learn about the Routing Methods

class MoviesListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MoviesListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade400,
      ),
      body: ListView(
        children: [
          MovieThumbnail(
            thumbnail: movie.images[0],
          ),
          MovieDetailsHeaderwithPoster(
            movie: movie,
          ),
        ],
      ),
    );
  }
}

class MovieThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double val = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: val / 1.5,
              width: val * 4,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          height: 450,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
