import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SSong extends StatefulWidget {
  const SSong({super.key});

  @override
  State<SSong> createState() => _SSongState();
}

class _SSongState extends State<SSong> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 28.h,
            width: 17.h,
            margin: EdgeInsets.only(right: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 21.h,
                  width: 18.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 11.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400),
                )
              ],
            ));
        },
      ),
    );
  }
}
