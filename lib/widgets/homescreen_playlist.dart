import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/screens/artist_screen.dart';

class HPlaylist extends StatefulWidget {
  final String id;
  final String songName;
  final String artist;
  const HPlaylist({super.key, required this.songName, required this.artist, required this.id});

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
                Text("${widget.songName}", style: AppConstant().araBaslikStyle,maxLines: 1,overflow: TextOverflow.ellipsis,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(id: widget.id),));
                  },
                  child: Text("${widget.artist}", style: AppConstant().artistStyle,)),
              ],
            ),
          ),
          Image.asset("assets/Heart 1.png")
        ],
      ),
    );
  }
}
