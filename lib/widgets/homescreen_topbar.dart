import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            size: 34,
            color: Colors.grey.shade700,
          ),
          Image.network(
            "https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_RGB_Green.png",
            height: 4.5.h,
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
