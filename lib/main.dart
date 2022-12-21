import 'package:flutter/material.dart';
import 'package:flutter_zapix/products/screens/product_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'products/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DotShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          toolbarHeight: 64,
          elevation: 0,
          backgroundColor: Pallete.background,
          titleTextStyle: TextStyle(
            color: Pallete.listText,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
        scaffoldBackgroundColor: Pallete.background,
      ),
      home: const ProductScreen(),
    );
  }
}
