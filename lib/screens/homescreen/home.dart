import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yellowclassapp/models/movie.dart';
import 'package:yellowclassapp/screens/homescreen/moviesList.dart';
import 'package:yellowclassapp/screens/homescreen/registermovie.dart';
import 'package:yellowclassapp/services/authService.dart';
import 'package:yellowclassapp/services/movieProvider.dart';


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Movie>>.value(
      value: MovieProvider.instance.moviesStream,
      initialData: [],
      child: Scaffold(
        backgroundColor: Color.fromRGBO(28, 27, 37, 1),
        // appBar: AppBar(
        //   title: Text('Movies List'),
        //   actions: [
        //     TextButton(
        //         onPressed: () {
        //           AuthService().logout();
        //         },
        //         child: Text('Logout'))
        //   ],
        // ),
        body: Column(
          children: [
            SizedBox(height: 200),
            Text(""),
            SizedBox(
                height: 500,
                child: MovieListView()
            ),
          ],
        ),





        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddMovieList()));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}
