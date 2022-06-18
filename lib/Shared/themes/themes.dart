import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light = ThemeData(
  primaryColor: Colors.black,
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.deepOrange,
        statusBarIconBrightness: Brightness.light,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey[840],
    selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )
  ),
);


ThemeData dark = ThemeData(
  primaryColor: Colors.white,
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.deepOrange,
      size: 30,
      opacity: 100,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white10,
      statusBarIconBrightness: Brightness.light,
    ),
    color: Colors.white10,
    titleTextStyle: TextStyle(
      color: Colors.deepOrange,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSpacing: 20,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white10,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.black,
    selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.deepOrange,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      )
  ),
);