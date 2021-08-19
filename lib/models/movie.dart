

import 'package:yellowclassapp/databaseservices/dbhelper.dart';

class Movie {
  String? name;
  String? director;
  String? cover;

  Movie();

  Movie.fromMap(Map<String, dynamic> map) {
    this.name = map[DBhelper.NAME];
    this.director = map[DBhelper.DIRECTOR];
    this.cover = map[DBhelper.COVER];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DBhelper.NAME: this.name,
      DBhelper.DIRECTOR: this.director,
      DBhelper.COVER: this.cover
    };
    return map;
  }
}
