import '/utils/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final lightTheme = ThemeData(
      primaryColor: primaryColor,
      // fontFamily: 'Helvetica',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: accentColor,
        selectedItemColor: primaryColor,
        selectedIconTheme: IconThemeData(color: primaryColor),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      )
      // errorColor: secondaryColor,
      );
}
