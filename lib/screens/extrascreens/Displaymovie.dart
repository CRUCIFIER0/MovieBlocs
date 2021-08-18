import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:yellowclassapp/models/movie.dart';
import 'package:yellowclassapp/utils/utility.dart';

class DisplayMovie extends StatefulWidget {
  DisplayMovie(
      {Key? key,
        this.img64 = "",
        this.director = "",
        this.name = "",
        this.ogName = "",
       this.rating= ""})
      : super(key: key);
  String? img64;
  String? name;
  String? ogName;
  String? director;
   String rating;
  @override
  _DisplayMovieState createState() => _DisplayMovieState();
}

class _DisplayMovieState extends State<DisplayMovie> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(EvaIcons.arrowIosBack,color: Colors.white,size: 30,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromRGBO(28, 27, 37, 1),
        actions: [
          LikeButton(
            size: 50,
            circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                EvaIcons.bookmark,
                color: isLiked ? Colors.yellowAccent : Colors.white,
                size: 20,
              );
            },


          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 24, right: 24,top: 30),
        child: Center(
          child: Column(

            children: [
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Utility.imageFromBase64Stringnew(widget.img64!),
                ),
              ),
              SizedBox(height: 30,),
              Text(widget.name!,style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500))),
              SizedBox(height: 8,),
              Text("2020      Horror/Thriller      2h 14m",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400))),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                  rating: 4,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  unratedColor: Colors.amber.withAlpha(50),
                  direction: Axis.horizontal,
                ),
                  SizedBox(width: 10,),
                  Text(widget.rating,style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.yellow, fontSize: 16, fontWeight: FontWeight.w800))),
                  Text(" /10",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w800)))

                ],
              ),
              SizedBox(height: 20,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis auctor felis. Vivamus porttitor pulvinar ultricies.",textAlign: TextAlign.center, style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400,))),
              SizedBox(height: 40,),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(

                    onPressed: () {
                          //do nothing

                    },
                    child: Text(
                      "See More Details",
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
                    )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
