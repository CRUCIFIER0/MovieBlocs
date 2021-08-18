import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowclassapp/screens/login/SignUpscreen.dart';
import 'package:yellowclassapp/services/authService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggingIn = false;
  String user='';
  String pass='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 27, 37, 0.8) ,
        body: SafeArea(
          child: Center(
            child: (isLoggingIn)
                ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )
                : Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 24,right: 22),
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    Align(alignment:Alignment.topLeft,child: Text("Let's sign you in.",style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
                    SizedBox(height: 15,),
                    Align(alignment:Alignment.topLeft,child: Text("Welcome back.",style: GoogleFonts.rubik(fontSize: 28, color: Colors.grey, fontWeight: FontWeight.w500,),)),
                    Align(alignment:Alignment.topLeft,child: Text("You've been missed !",style: GoogleFonts.rubik(fontSize: 28, color: Colors.grey, fontWeight: FontWeight.w500,),)),
                    Container(
                      margin: EdgeInsets.only(top: 40, right: 8, left: 8),
                      //color: Colors.grey,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff575757),
                        border: Border.all(
                          color: Color(0xff575757),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(17),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12,),
                          Expanded(
                            child: TextField(
                              //controller: myController,
                              style: TextStyle(fontSize: 16, color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Phone, email or username',
                                hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onChanged: (val){
                                setState(() {
                                  user=val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 8, left: 8),
                      //color: Colors.grey,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff575757),
                        border: Border.all(
                          color: Color(0xff575757),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(17),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12,),
                          Expanded(
                            child: TextFormField(
                              //controller: myController,

                              obscureText: true,
                              style: TextStyle(fontSize: 16, color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,

                              ),
                              onChanged: (val){
                                setState(() {
                                  pass=val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 140,),

                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Align(alignment:Alignment.center,child: Row(
                        children: [
                          Text("Don't have an account?   ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500,),),
                          InkWell(
                              onTap:() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },

                              child: Text("Register",style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500,),)

                          ),
                        ],
                      )),
                    ),


                    SizedBox(height: 30,),
                    Container(

                      margin: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: InkWell(
                        onTap: () async{
                          // dynamic result = await _auth.singnInUsingEmail(
                          //     user, pass);
                          // if (result == null) {
                          //
                          //   setState(() {
                          //     // ignore: deprecated_member_use
                          //     Scaffold.of(context).showSnackBar((SnackBar(
                          //       content: new Text("Incorrect Email/ Password"),
                          //       duration: Duration(seconds: 3),
                          //     )));
                          //     loading = false;
                          //   });
                          // } else {
                          //   setState(() {
                          //     loading = false;
                          //   });
                          // }
                        },
                        child: Container(
                          height: 70,
                          width: 430,
                          //color: Colors.white,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child:  Center(child: Text("Sign In",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(

                      margin: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: InkWell(
                        onTap: () async{

                          setState(() {
                            isLoggingIn = true;
                          });
                          await AuthService().login();
                          setState(() {
                            isLoggingIn = false;
                          });
                          Navigator.pop(context);

                        },
                        child: Container(
                          height: 70,
                          width: 430,
                          //color: Colors.white,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child:  Center(child: Text("Sign In With Google",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () async {
                    //     setState(() {
                    //       isLoggingIn = true;
                    //     });
                    //     await AuthService().login();
                    //     setState(() {
                    //       isLoggingIn = false;
                    //     });
                    //     Navigator.pop(context);
                    //   },
                    //   child: Text(
                    //     'SignIn Using Google',
                    //     style: TextStyle(color: Colors.red, fontSize: 14),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.white,
                    //     padding: EdgeInsets.only(
                    //         left: 18, right: 18, top: 8, bottom: 9),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8)),
                    //   ),
                    // ),



                  ],
                )
            ),


          ),
        ));
  }
}
