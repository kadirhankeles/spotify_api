import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 15.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2.h ,vertical: 1.5.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Album", style: AppConstant().bannerTextSmall ),
            SizedBox(height: 0.4.h,),
            Text("Happier Than\nEver", style: AppConstant().bannerTextBig,),
            SizedBox(height: 0.4.h,),
            Text("Billie Eilish", style: AppConstant().bannerTextMedium,)
          ],
        ),
        decoration: AppConstant().bannerStyle,
      ), Positioned(child: Image.asset("assets/Union.png", height: 25.h,color: Colors.white,), left: 24.h, top: 4.h, )]
    );
  }
}
