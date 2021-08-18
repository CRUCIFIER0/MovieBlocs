import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yellowclassapp/services/authService.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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



              CircleAvatar(
                radius: 60,
                child: ClipOval(child: Image.network("https://avatars.githubusercontent.com/u/34376046?v=4" )),
                backgroundColor:Colors.transparent ,
              ),
              SizedBox(height: 40,),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:24 ,top: 24,right: 24),
                    width: double.infinity,
                    //color: Color.fromRGBO(20, 20,26, 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
                      color: Color.fromRGBO(20, 20,26, 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tejeswar Allaka",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),),
                        SizedBox(height:10),
                        Text("My name is Tejeswar, your not-so-typical engineering undergraduate with specs 👓, pursuing CS from Vellore Institute of Technology. Been ramsacking and squandering over 21 years now, I am keen on taking on every step which accentuate me 🧗. From making music 🎸 to writing code 📋, from being a swimmer 🏊‍♂️ to beign a gamer 🎮, I am safe to say I’ve nothing to be regretful of not doing something anymore till now. Well, there’s always a long bucket list, but hey, there’s still a long life to live yet.Now, the purpose of this website is for me to share my blogs, and short stories that I would write normally someplace else.Hope you have a good time and like the content that you find over here.",
                          style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),),

                        SizedBox(height: 30,),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(

                              onPressed: () {


                              },
                              child: Text(
                                "More about me",
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
                              )
                          ),
                        ),
                        SizedBox(height: 30,),
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
  _launchURL() async {
    const url = 'https://tejeswarallaka.me';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
