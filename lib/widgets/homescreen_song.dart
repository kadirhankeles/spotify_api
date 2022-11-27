import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/top_track_provider.dart';
import 'package:spotify_api/screens/artist_screen.dart';

class HSong extends StatefulWidget {
  final String imagePath;
  final String songName;
  final String artist;
  final String id;
  const HSong({super.key, required this.imagePath, required this.songName, required this.artist, required this.id});

  @override
  State<HSong> createState() => _HSongState();
}

class _HSongState extends State<HSong> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(
        height: 28.h,
        width: 17.h,
        margin: EdgeInsets.only(right: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 21.h,
              width: double.infinity,
              child: AppConstant().profilePhotos("${widget.imagePath}", 25),

            ),
            SizedBox(height: 1.h,),
            Padding(
              padding:  EdgeInsets.only(left: 1.2.h),
              child: Text("${widget.songName}",maxLines: 1,overflow: TextOverflow.ellipsis, style: AppConstant().profileTitle,),
            ),
            SizedBox(height: 0.5.h,),
            Padding(
              padding: EdgeInsets.only(left: 1.2.h),
              child: GestureDetector(
                onTap: () {
                  print("Gelen id: "+widget.id);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(id: widget.id,),));
                },
                child: Text("${widget.artist}", style: AppConstant().artistStyle, )),
            ),
          ],
        ),
      ), Positioned(child: Image.asset("assets/Group 27.png"), top: 18.5.h, left: 12.5.h,)] 
    );
  }
}