import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify_api/core/constant.dart';

class ShimmerCategory extends StatefulWidget {
  const ShimmerCategory({super.key});

  @override
  State<ShimmerCategory> createState() => _ShimmerCategoryState();
}

class _ShimmerCategoryState extends State<ShimmerCategory> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
      child: Container(
        width: double.infinity,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (context, index) {
              return Container(
                height: 19.h,
                width: 16.h,
                child: Column(
                  children: [
                    Container(
                      height: 16.h,
                      width: 16.h,
                      decoration: AppConstant().shimmerRadius,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                   Container(
                    height: 2.h,
                    width: 10.h,
                    decoration: AppConstant().shimmerRadius,
                   )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
