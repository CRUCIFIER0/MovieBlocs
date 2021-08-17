import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:yellowclassapp/models/movie.dart';
import 'package:yellowclassapp/screens/homescreen/moviesList.dart';
import 'package:yellowclassapp/screens/homescreen/registermovie.dart';
import 'package:yellowclassapp/services/authService.dart';
import 'package:yellowclassapp/services/movieProvider.dart';


class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String city='';
    final myController = TextEditingController();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            Container(
              margin: EdgeInsets.only(top: 40, right: 24, left: 24),
              //color: Colors.grey,
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff2e2e3b),
                border: Border.all(
                  color: Color(0xff2e2e3b),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(EvaIcons.search,color: Colors.grey,), onPressed: null),
                  SizedBox(width: 7,),
                  Expanded(
                    child: TextField(
                      controller: myController,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 18.0, color: Color(0xff43434a)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            myController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onSubmitted: (value){
                        setState(){
                          city=value;
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 25,),
                Text("Your ", style: GoogleFonts.workSans(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),),
                Text("Movies", style: GoogleFonts.workSans(textStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400)),),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
                height: 550,
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
