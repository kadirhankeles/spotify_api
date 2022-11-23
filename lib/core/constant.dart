import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  final profileTitle = GoogleFonts.openSans(
      fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0);
  final emailStyle =
      GoogleFonts.openSans(fontSize: 12, color: Colors.grey.shade700);
  final profileNameStyle =
      GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold);
  final takipciStyle =
      GoogleFonts.openSans(fontSize: 21, fontWeight: FontWeight.bold);
  final araBaslikStyle =
      GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold);
  final artistStyle = GoogleFonts.openSans(
    fontSize: 13,
  );

  BoxDecoration profilePhoto(String path, double radius) {
    return BoxDecoration(
        color: Colors.black,
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(radius),
        );
  }
}
