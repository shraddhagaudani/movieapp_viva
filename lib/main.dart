import 'package:flutter/material.dart';
import 'package:movieapp_viva/utills/apptheme.dart';
import 'package:movieapp_viva/views/screens/detailspage.dart';
import 'package:movieapp_viva/views/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: Apptheme.lighttheme,
      darkTheme: Apptheme.darktheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Homepage(),
        'Detailspage': (context) => const Detailspage(),
      },
    ),
  );
}
