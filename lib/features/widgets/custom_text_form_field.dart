import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnChanged =void Function(String)?;
typedef OnValidator = String? Function(String?)? ;
class CustomTextFormField extends StatelessWidget {
  Color? borderSideColor;
  Color? fillColor;
  bool? filled;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  TextStyle? errorStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  OnChanged onChanged;
  TextEditingController? controller;
  OnValidator validator;
  TextInputType? keyboardType;
  String obscuringCharacter;
  bool obscureText;
  double verticalPadding;
  double horizontalPadding;
  CustomTextFormField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.fillColor,
    this.filled,
    this.borderSideColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText=false,
    this.obscuringCharacter='.',
    this.keyboardType,
    this.errorStyle,
    this.verticalPadding = 16,
    this.horizontalPadding = 15
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

    maxLines: maxLines ?? 1,
      controller:controller ,
      onChanged:onChanged ,
      validator:validator ,
      obscureText: obscureText,
      obscuringCharacter:obscuringCharacter ,
      keyboardType:  keyboardType,
      style: AppStyles.medium18Primary,
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20.h,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding.h,
            horizontal: horizontalPadding.w
        ),
        filled: filled,
        fillColor: fillColor,
        errorMaxLines: 2,
        errorStyle: errorStyle,
        enabledBorder: builtDecorationBorder(
          borderColor: borderSideColor ?? AppColors.transParentColor,
        ),
        focusedBorder: builtDecorationBorder(
          borderColor: borderSideColor ?? AppColors.transParentColor,
        ),
        errorBorder: builtDecorationBorder(borderColor: AppColors.redColor),
        focusedErrorBorder: builtDecorationBorder(
          borderColor: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 2, color: borderColor),
    );
  }
}
