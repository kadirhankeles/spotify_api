import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class HSong extends StatelessWidget {
  final String imagePath;
  final String songName;
  final String artist;
  const HSong({super.key, required this.imagePath, required this.songName, required this.artist});

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
              decoration: AppConstant().profilePhoto("$imagePath", 25),
            ),
            SizedBox(height: 1.h,),
            Padding(
              padding:  EdgeInsets.only(left: 1.2.h),
              child: Text("$songName",maxLines: 1,overflow: TextOverflow.ellipsis, style: AppConstant().profileTitle,),
            ),
            SizedBox(height: 0.5.h,),
            Padding(
              padding: EdgeInsets.only(left: 1.2.h),
              child: Text("$artist", style: AppConstant().artistStyle,),
            ),
          ],
        ),
      ), Positioned(child: Image.asset("assets/Group 27.png"), top: 18.5.h, left: 12.5.h,)] 
    );
  }
}