import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yellowclassapp/services/authService.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
final List<String> imgList = [

  "https://m.media-amazon.com/images/M/MV5BMWYxOTFlMjgtZTMyMS00OGRkLTk5ZGEtMDI2N2ZjN2EzZjg4XkEyXkFqcGdeQXVyMTIyMjI4OTkx._V1_FMjpg_UX1000_.jpg",
  "https://m.media-amazon.com/images/I/81LBzgzf0iL._SY741_.jpg",
  "https://m.media-amazon.com/images/M/MV5BYzQ0ZWIxZjAtYWI3Yy00MGM0LWFjOGYtNzcyYThiOTA3ODI1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg",
  "https://img.cinemablend.com/quill/5/b/e/1/f/a/5be1fa25086c6318e8b6c931d76c6bfc2365660f.jpg",
  "https://pbs.twimg.com/media/EJ9M3BsXsAUcSxf.jpg:large",
];

class _MainPageState extends State<MainPage> {


  AuthService auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(28, 27, 37, 1),
        body:Container(

          margin: EdgeInsets.only(top: 60,right: 10,left: 24),
          child: Column(

            children: [
              Container(
                margin: EdgeInsets.only(right: 26),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(

                        children: [
                          Text("Hello ",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),),
                          Text(auth.firebaseAuth.currentUser!.displayName!.split(" ")[0]+"!",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400)),),
                        ],
                      ),
                      SizedBox(height: 0),
                      Text("All your movies at one place",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300)))
                    ],),
                    Spacer(),
                    auth.getprofileImage(),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(right: 26),
                padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color:Color.fromRGBO(34, 33, 43, 1),
                ),
                //color: Colors.grey,
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 40,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color:Color.fromRGBO(49, 48, 59, 1),
                      ),
                      child: Center(child: Text("Movies",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500)))),
                    ),
                    Container(
                      width: 150,
                      height: 40,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color:Colors.transparent,
                      ),
                      child: Center(child: Text("Series",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500)))),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(

                children: [
                  Text("Featured ",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),),
                  Text("Movies",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400)),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 0),
                height: 300,
                width: double.infinity,
                child: SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            InkWell(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.network(
                                  imgList[index],
                                  height: 3320.0,
                                  width: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 15,)
                          ],
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
