import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SProfilePhoto extends StatefulWidget {
  const SProfilePhoto({super.key});

  @override
  State<SProfilePhoto> createState() => _SProfilePhotoState();
}

class _SProfilePhotoState extends State<SProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(0),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
        ),
        elevation: 2,
        shadowColor: Colors.grey.shade300,
        child: Padding(
          padding:  EdgeInsets.only(top: 3.h, left: 7.w, right: 7.w),
          child: Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4.h,
                      width: 4.h,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Icon(Icons.arrow_back_ios_new, size: 15,),
                      ),
                    ),
                    
                    Icon(Icons.more_vert_rounded, color: Colors.grey,)
                  ],
                ),
              ),
              SizedBox(height: 1.5.h,),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
                child: Container(
                  height: 10.h,
                  width: 10.h,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade500),
                ),
              ),
              SizedBox(height: 1.5.h,),
             // Text("$email", style: AppConstant().emailStyle ,),
              SizedBox(height: 1.h,),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.07)!,
      highlightColor: Colors.grey.withOpacity(.25)!,
                child: Column(
                  children: [
                    Container(height: 2.h,
                width: 12.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade500),),
                SizedBox(height: 2.h,),
                Container(height: 2.h,
                width: 18.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade500),),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}