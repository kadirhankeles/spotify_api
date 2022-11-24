import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class HPlaylist extends StatefulWidget {
  final String songName;
  final String artist;
  const HPlaylist({super.key, required this.songName, required this.artist});

  @override
  State<HPlaylist> createState() => _HPlaylistState();
}

class _HPlaylistState extends State<HPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      height: 7.h,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            "assets/Group 27.png",
          ),
          SizedBox(width: 2.5.h,),
          Container(
            height: 7.h,
            width: 34.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${widget.songName}", style: AppConstant().araBaslikStyle,),
                Text("${widget.artist}", style: AppConstant().artistStyle,),
              ],
            ),
          ),
          Image.asset("assets/Heart 1.png")
        ],
      ),
    );
  }
}
