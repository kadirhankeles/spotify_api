import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SArtistPhoto extends StatefulWidget {
  const SArtistPhoto({super.key});

  @override
  State<SArtistPhoto> createState() => _SArtistPhotoState();
}

class _SArtistPhotoState extends State<SArtistPhoto> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
      child: Container(
        height: 28.h,
        width: double.infinity,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(90),
            ),
            color: Colors.grey),
      ),
    );
  }
}
