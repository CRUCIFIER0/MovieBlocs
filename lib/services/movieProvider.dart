import 'dart:async';


import 'package:yellowclassapp/databaseservices/dbhelper.dart';
import 'package:yellowclassapp/models/movie.dart';

class MovieProvider {
  static final MovieProvider instance = MovieProvider();
  List<Movie> movies = [];

  StreamController<List<Movie>> _streamController =
      StreamController<List<Movie>>.broadcast();
  Stream<List<Movie>> get moviesStream {
    return _streamController.stream;
  }

  getMovies() async {
    movies = await DBhelper.instance.getMovies();
    _streamController.add(movies);
  }

  addMovie(Movie movie) async {
    await DBhelper.instance.insert(movie);
    await getMovies();
  }

  updateMovies(Movie movie, String ogName) async {
    await DBhelper.instance.update(movie, ogName);
    await getMovies();
  }

  deleteMovie(Movie movie) async {
    await DBhelper.instance.delete(movie);
    await getMovies();
  }
}
