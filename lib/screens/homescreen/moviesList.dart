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
  ScrollController _scrollController = ScrollController();
  List<Movie> movie = [];
  bool hasMore =false;
  bool loading =false;
  late Movie lastdocument;
  int doclimit=10;
  getfeed() async{
    if(!hasMore){
      return;
    }
    if(loading){
      return;
    }
    setState(() {
      loading=true;
    });
    Movie querySnapshot;
    if(lastdocument==null){
      var movies = Provider.of<List<Movie>>(context);    }else{
      // =await DatabaseService.firestore.collection('Post').limit(doclimit).getDocuments();
    }

    movie.addAll(movie);
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {

    var movies = Provider.of<List<Movie>>(context);
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta =MediaQuery.of(context).size.height *0.2;
      if(maxScroll-currentScroll<=delta){
        getfeed();
      }
    });
    // ignore: unnecessary_null_comparison
    return (movies.length==0)
        ? Column(
          children: [
            Image(image: AssetImage('assets/music file2-05.png'),),
            Text("You have no movies", style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)))
          ],
        )
        :  ListView.separated(
                  controller: _scrollController,
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
