import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  Color decorationColor;
  Color? borderSideColor;
  Widget child;
  double height;
  void Function() onPressed;
  double borderRadius;

  CustomElevatedButton(
      {super.key, required this.child, required this.decorationColor, this.borderSideColor, required this.onPressed, required this.borderRadius, this.height = 14 });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: borderSideColor??AppColors.transParentColor
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius.r)),
            backgroundColor: decorationColor,
            padding: EdgeInsets.symmetric(vertical: height)
        ),
        onPressed:onPressed, child:child
    );
  }
}
