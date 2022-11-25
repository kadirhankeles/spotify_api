import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SPlaylist extends StatefulWidget {
  const SPlaylist({super.key});

  @override
  State<SPlaylist> createState() => _SPlaylistState();
}

class _SPlaylistState extends State<SPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
      child: Container(
        height: 80.h,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:10,
          itemBuilder: (context, index) {
            return  Container(
            margin: EdgeInsets.only(bottom: 2.h),
            height: 7.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey.shade400),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 1.5.h),
                  height: 4.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade500),
                ),
                SizedBox(
                  width: 2.5.h,
                ),
                Container(
                  height: 7.h,
                  width: 34.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1.5.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade500),
                      ),
                      Container(
                        height: 1.5.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          },
        ),
      ),
    );
  }
}
