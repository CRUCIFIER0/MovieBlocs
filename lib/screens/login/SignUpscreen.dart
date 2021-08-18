import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowclassapp/screens/login/loginscreen.dart';
import 'package:yellowclassapp/screens/login/register.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 0.8) ,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image(image: AssetImage('assets/music file2-04.png'),height: 350,),
            ),
            SizedBox(height: 30,),
            Text("Bringing your \nmovies closer",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 40),
              child: Text("All your movies at one spot. Add new movies, edit them, save them for watching later. ",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'PublicaSans', fontSize: 16,color: Colors.grey),),
            ),

            SizedBox(height: 70,),
            Container(

              margin: EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(
                  color: Color(0xff444447),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: Row(children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 170,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child:  Center(child: Text("Register",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width/2.5,
                    child:  Center(child: Text("Sign In",style: GoogleFonts.rubik(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700,),)),

                  ),
                )

              ],),
            )

          ],
        ),
      ),
    );
  }
}