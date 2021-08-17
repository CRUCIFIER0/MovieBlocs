import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: Colors.yellowAccent,
    appBarTheme: AppBarTheme(  
      color: Colors.yellowAccent,
      centerTitle: true,
      textTheme: TextTheme(  
        headline6: TextStyle(  
          color: Colors.black,
          fontSize: 22,
        )
      ),
      elevation: 0,
    ),
    textTheme: TextTheme(  
      subtitle1: TextStyle(  
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
      subtitle2: TextStyle(  
        fontSize: 16,
        fontWeight: FontWeight.normal
      ),
      bodyText2: TextStyle(  
        fontSize: 13
      )
    ),
    iconTheme: IconThemeData(  
      size: 22,
      color: Colors.black
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(  
      backgroundColor: Colors.yellowAccent,
      foregroundColor: Colors.black
    ),
    dividerColor: Colors.black54,
    textButtonTheme: TextButtonThemeData(  
      style: TextButton.styleFrom(
        primary: Colors.black,
      )
    ),
    inputDecorationTheme: InputDecorationTheme(  
      hintStyle: TextStyle(  
        fontSize: 14,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(  
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      )
    )
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(  
      color: Colors.deepOrange,
      centerTitle: true,
      textTheme: TextTheme(  
        headline6: TextStyle(  
          color: Colors.white,
          fontSize: 22,
        )
      ),
      elevation: 0,
      actionsIconTheme: IconThemeData(  
        color: Colors.white,
      )
    ),
    textTheme: TextTheme(  
      subtitle1: TextStyle(  
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
      subtitle2: TextStyle(  
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal
      ),
      bodyText2: TextStyle(  
        color: Colors.white,
        fontSize: 13
      ) 
    ),
    iconTheme: IconThemeData(  
      color: Colors.white,
      size: 20
    ),
    cardColor: Colors.black87,
    cardTheme: CardTheme(
      shadowColor: Colors.yellowAccent[100]
    ),
  );
}
