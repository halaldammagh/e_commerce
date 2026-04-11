import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  Color decorationColor;
  Color? borderSideColor;
  Widget child;
  void Function() onPressed;
  double borderRadius;

  CustomElevatedButton(
      {super.key, required this.child, required this.decorationColor, this.borderSideColor, required this.onPressed, this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: borderSideColor??AppColors.transParentColor
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius.r)),
            backgroundColor: decorationColor,
            padding: EdgeInsets.symmetric(vertical: height*0.015)
        ),
        onPressed:onPressed, child:child
    );
  }
}
