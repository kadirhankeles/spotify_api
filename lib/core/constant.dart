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
  //BANNER
  final bannerStyle = BoxDecoration(color: Color(0xff42C83C), borderRadius: BorderRadius.circular(20));
  final bannerTextSmall = GoogleFonts.openSans(color: Colors.white, fontSize: 10,);
  final bannerTextBig = GoogleFonts.openSans(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold);
  final bannerTextMedium = GoogleFonts.openSans(color: Colors.white, fontSize: 13,);
  
  //CATEGORY
  final categoryStyle = GoogleFonts.openSans(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);


  //ARTİST
  final albumsStyle = GoogleFonts.openSans(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600);

  final baslikStyle =
      GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold);

  final  shimmerRadius = BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400);

  BoxDecoration profilePhoto(String path, double radius) {
    return BoxDecoration(
        color: Colors.black,
       // image: DecorationImage(image: NetworkImage(path), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(radius),
        );
  }
  BoxDecoration artistPhoto(String path, double radius) {
    return BoxDecoration(
        color: Colors.black,
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.cover),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius) ),
        );
  }

  Widget profilePhotos(String path, double radius){
    return ClipRRect(
                                borderRadius: BorderRadius.circular(radius),
                                child: Image.network(
                                  path,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.green,
                                      ),
                                    );
                                  },
                                )
                                );
  }

}
