import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yellowclassapp/models/movie.dart';
import 'package:yellowclassapp/services/movieProvider.dart';
import 'package:yellowclassapp/utils/utility.dart';

// ignore: must_be_immutable
class AddMovieList extends StatefulWidget {
  AddMovieList(
      {Key? key,
      this.img64 = "",
      this.isEditing = false,
      this.director = "",
      this.name = "",
      this.ogName = ""})
      : super(key: key);
  String? img64;
  String? name;
  String? ogName;
  String? director;
  bool isEditing;
  @override
  _AddMovieListState createState() => _AddMovieListState();
}

class _AddMovieListState extends State<AddMovieList> {
  pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      widget.img64 = Utility.base64String(await value!.readAsBytes());
      setState(() {
        widget.img64 = widget.img64;
      });
    });
  }

  String? formValidator(String? vlaue) {
    return (vlaue == "") ? 'This field cannot be empty' : null;
  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.isEditing) {
      nameController.text = widget.name!;
      directorController.text = widget.director!;
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      appBar: AppBar(
          leading: new IconButton(
          icon: new Icon(EvaIcons.arrowIosBack, size: 30,color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
                child: Column(
              children: [


                Align(alignment: Alignment.topLeft,child:Text("Title of the movie ",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),),),

                Container(
                  margin: EdgeInsets.only(top: 10, right: 0, left: 0),
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
                      //IconButton(icon: Icon(EvaIcons.search,color: Colors.grey,), onPressed: null),
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextFormField(
                            style: Theme.of(context).inputDecorationTheme.hintStyle,
                            controller: nameController,
                            validator: formValidator,
                          decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,

                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.topLeft,child: Text("Director of the movie ",style: GoogleFonts.catamaran(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),)),

                Container(
                  margin: EdgeInsets.only(top: 10, right: 0, left: 0),
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
                      //IconButton(icon: Icon(EvaIcons.search,color: Colors.grey,), onPressed: null),
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).inputDecorationTheme.hintStyle,
                          controller: directorController,
                          validator: formValidator,
                          decoration: InputDecoration(
                            hintText: 'Director',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,

                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Stack(

                    children: [
                      (widget.img64 == "")
                          ? Container(
                        margin: EdgeInsets.all(16),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(30, 30, 49, 1).withOpacity(1)),
                        child: Center(
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 13),
                            )),
                      )
                          : Container(
                              margin: EdgeInsets.all(16),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Utility.imageFromBase64String(widget.img64!)),
                      ),

                      Positioned(
                        top: 90,
                        left: 90,
                        child: IconButton(
                          icon: Icon(EvaIcons.plusCircle,size: 40,color: Colors.grey.withOpacity(0.7),),
                          onPressed: () => pickImage(),
                        ),
                      )
                    ],
                  ),
                
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(

                      onPressed: () {
                        if (!_key.currentState!.validate()) return;
                        print(nameController.text);
                        Movie movie = Movie();
                        movie.name = nameController.text;
                        movie.director = directorController.text;
                        movie.cover = widget.img64;
                        if (widget.isEditing) {
                          MovieProvider.instance
                              .updateMovies(movie, widget.ogName!);
                           Navigator.pop(context);
                        } else {
                          MovieProvider.instance.addMovie(movie);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        (widget.isEditing) ? 'Update' : 'Add',
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
                      )
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
