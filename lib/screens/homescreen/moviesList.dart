import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:yellowclassapp/components/moviecard.dart';
import 'package:yellowclassapp/models/movie.dart';
import 'package:yellowclassapp/services/movieProvider.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  void initState() {
    MovieProvider.instance.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<List<Movie>>(context);
    // ignore: unnecessary_null_comparison
    return (movies.length==0)
        ? Column(
          children: [
            Image(image: AssetImage('assets/music file2-05.png'),),
            Text("You have no movies", style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)))
          ],
        )
        :  ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10,);
                  },
                  shrinkWrap: true,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MovieCard(
                          movie: movies[index],
                        ),
                      ],
                    );
                  });


  }
}
