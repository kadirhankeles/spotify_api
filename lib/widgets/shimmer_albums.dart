import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SAlbums extends StatefulWidget {
  const SAlbums({super.key});

  @override
  State<SAlbums> createState() => _SAlbumsState();
}

class _SAlbumsState extends State<SAlbums> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
      child: Container(
        height: 19.h,
        width: 15.h,
        margin: EdgeInsets.only(right: 2.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {  
            return Column(
            children: [
              Container(
                height: 14.h,
                width: 15.h,
                margin: EdgeInsets.only(right: 2.h),
                decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 2.h,
                width: 15.h,
                margin: EdgeInsets.only(right: 2.h),
                decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
