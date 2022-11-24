import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class AAlbums extends StatefulWidget {
  final String imagePath;
  final String name;
  const AAlbums({super.key, required this.imagePath, required this.name});

  @override
  State<AAlbums> createState() => _AAlbumsState();
}

class _AAlbumsState extends State<AAlbums> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.5.h,
      width: 15.h,
      margin: EdgeInsets.only(right: 2.h),
      child: Column(
        children: [
          Container(
            height: 14.h,
            width: 15.h,
            decoration: AppConstant().profilePhoto("${widget.imagePath}", 20),
          ),
          SizedBox(height: 1.h,),
          Text("${widget.name}",maxLines: 2,overflow: TextOverflow.ellipsis, style: AppConstant().albumsStyle,)
        ],
      ),
    );
  }
}