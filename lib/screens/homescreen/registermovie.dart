import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('Add a movie'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Column(
                  children: [
                    (widget.img64 == "")
                        ? Container(
                            margin: EdgeInsets.all(16),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow),
                            child: Center(
                                child: Text(
                              'No Image Selected',
                              style: TextStyle(fontSize: 13),
                            )),
                          )
                        : Container(
                            margin: EdgeInsets.all(16),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Utility.imageFromBase64String(
                                    widget.img64!)),
                          ),
                    InkWell(
                      onTap: () => pickImage(),
                      child: Text(
                        'Upload/Change',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                TextFormField(
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                    controller: nameController,
                    validator: formValidator,
                    decoration: InputDecoration(
                      hintText: 'Title',
                    )),
                TextFormField(
                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                  controller: directorController,
                  validator: formValidator,
                  decoration: InputDecoration(hintText: 'Director'),
                ),
                SizedBox(height: 18),
                ElevatedButton(
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
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
