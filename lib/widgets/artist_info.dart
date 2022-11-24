import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';

class AInfo extends StatefulWidget {
  final String imagePath;
  final String name;
  final int followers;
  const AInfo({super.key, required this.name, required this.followers, required this.imagePath});

  @override
  State<AInfo> createState() => _AInfoState();
}

class _AInfoState extends State<AInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: double.infinity,

      child: Column(
        children: [
          Stack(
            children:[ Container(
              height: 28.h,
              width: double.infinity,
              decoration: AppConstant().artistPhoto("${widget.imagePath}", 60),
            ),
            Positioned(child: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios_new)), top: 2.h, left: 0.5.h,)
            ]
          ),
          SizedBox(height: 1.h,),
          Text("${widget.name}", style: AppConstant().baslikStyle,),
          SizedBox(height: 1.h,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.followers} followers", style: AppConstant().artistStyle,),
            ],
          ),
          SizedBox(height: 1.h,),
          SizedBox(),
          Container(
            height: 4.5.h,
            width: 40.h,
            child: Center(child: Text("Burada sanatçılar hakkında bilgiler yer alacak", style: AppConstant().emailStyle,)))
        ],
      ),
    );
  }
}
