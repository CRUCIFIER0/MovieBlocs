import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowclassapp/services/authService.dart';

class Curprofile extends StatefulWidget {
  @override
  _CurprofileState createState() => _CurprofileState();
}

class _CurprofileState extends State<Curprofile> {
  AuthService auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: SafeArea(
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                auth.getprofileImagebig(),
                // CircleAvatar(
                //   radius: 80,
                //   child: ClipOval(child: Image.network("https://avatars.githubusercontent.com/u/34376046?v=4" )),
                //   backgroundColor:Colors.transparent ,
                // ),
                SizedBox(height: 80,),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:24 ,top: 28,right: 24),

                      width: double.infinity,
                      //color: Color.fromRGBO(20, 20,26, 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
                        color: Color.fromRGBO(20, 20,26, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(auth.firebaseAuth.currentUser!.displayName!,style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),),
                          SizedBox(height: 180,),
                          Text("Don't forget to stream back in!",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.w400)),),
                          SizedBox(height: 20,),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(

                                onPressed: () {
                                  AuthService().logout();

                                },
                                child: Text(
                                  "Sign Out",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
                                )
                            ),
                          ),
                          SizedBox(height: 50,)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )

        ),
      ),
    );
  }
}
