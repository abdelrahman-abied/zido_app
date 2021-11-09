import 'package:flutter/material.dart';
import 'package:zido_app/screen/home_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes(context) {
  return {
    '/': (context) => HomeScreen(),
  };
}
