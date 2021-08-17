import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowclassapp/models/movie.dart';
import 'package:yellowclassapp/screens/homescreen/registermovie.dart';
import 'package:yellowclassapp/services/movieProvider.dart';
import 'package:yellowclassapp/utils/utility.dart';
import 'dart:math';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    double randomNumber = random.nextDouble() + 7+random.nextDouble() +random.nextDouble();
    return InkWell(
      onTap: (){
        Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context)=>AddMovieList(
                                isEditing: true,
                                name: movie!.name,
                                director: movie!.director,
                                img64: movie!.cover,
                                ogName: movie!.name,
                              )
                            )
                          );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.only(top: 10,left:10,right: 10,bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color:Color.fromRGBO(34, 33, 43, 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Utility.imageFromBase64String(movie!.cover!),
            ),

            SizedBox(width: 18,),
            Flexible(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie!.name.toString(), softWrap: true,overflow: TextOverflow.clip, maxLines: 2,style: GoogleFonts.spaceGrotesk(textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800))),
                  SizedBox(height: 10),
                  Text("⭐   "+randomNumber.toStringAsFixed(2) ,style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w800)),
                  SizedBox(height: 10),
                  Text(movie!.director.toString(),style: GoogleFonts.spaceGrotesk(textStyle: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w200))),
                ],
              ),
            )
          ],
        ),

      //     child: Row(
      //   children: [
      //     (movie!.cover==null ||  movie!.cover!.length==0)?Container(
      //       margin: EdgeInsets.all(16),
      //       width: 70,
      //       height: 70,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         color: Colors.yellow
      //       ),
      //       child: Center(
      //         child: Text('No Image Available', style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,)
      //       ),
      //     ):Container(
      //       margin: EdgeInsets.all(16),
      //       width: 70,
      //       height: 70,
      //       child: Utility.imageFromBase64String(movie!.cover!)
      //     ),
      //     Expanded(
      //       child: Container(
      //         margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               movie!.name.toString(),
      //               style: Theme.of(context).textTheme.subtitle1,
      //             ),
      //             SizedBox(height: 4),
      //             Text(
      //               movie!.director.toString(),
      //               style: Theme.of(context).textTheme.subtitle2,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           margin: EdgeInsets.only(right: 12, left: 12),
      //           child: InkWell(
      //             onTap: () {
      //               Navigator.push(
      //                 context, MaterialPageRoute(
      //                   builder: (context)=>AddMovieList(
      //                     isEditing: true,
      //                     name: movie!.name,
      //                     director: movie!.director,
      //                     img64: movie!.cover,
      //                     ogName: movie!.name,
      //                   )
      //                 )
      //               );
      //             },
      //             child: Row(
      //               children: [
      //                 Icon(Icons.edit),
      //                 Container(
      //                     margin: EdgeInsets.only(left: 4), child: Text('Edit'))
      //               ],
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 18),
      //         Container(
      //           margin: EdgeInsets.only(right: 12, left: 12),
      //           child: InkWell(
      //             onTap: () {
      //               MovieProvider.instance.deleteMovie(movie!);
      //             },
      //             child: Row(
      //               children: [
      //                 Icon(Icons.delete),
      //                 Container(
      //                     margin: EdgeInsets.only(left: 4), child: Text('Delete'))
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     )
      //   ],
      // )
      ),
    );
  }
}
