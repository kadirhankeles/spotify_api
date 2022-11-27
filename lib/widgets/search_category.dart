import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class SCategory extends StatefulWidget {
  final String imagePath;
  final String categoryName;
  const SCategory({super.key, required this.imagePath, required this.categoryName});

  @override
  State<SCategory> createState() => _SCategoryState();
}

class _SCategoryState extends State<SCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: 16.h,

      child: Column(
        children: [
          Container(
            height: 16.h,
            width: 16.h,
            child: AppConstant().profilePhotos("${widget.imagePath}", 20),
          ),
          SizedBox(height: 0.5.h,),
          Center(child: Text("${widget.categoryName}", style: AppConstant().araBaslikStyle, maxLines: 1, overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }
}
