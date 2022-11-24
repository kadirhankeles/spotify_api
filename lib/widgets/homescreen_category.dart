import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class HCategory extends StatefulWidget {
  final String categoryName;
  const HCategory({super.key, required this.categoryName});

  @override
  State<HCategory> createState() => _HCategoryState();
}

class _HCategoryState extends State<HCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 27.w,
      child: Center(child: Text(widget.categoryName, style: AppConstant().categoryStyle,)),
    );
  }
}