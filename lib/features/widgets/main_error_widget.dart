import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onPressed;

  const MainErrorWidget({required this.errorMessage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Text(errorMessage, style: AppStyles.semi20Primary),
        onPressed != null
            ? ElevatedButton(
                onPressed: onPressed,
                child: Text('Try Again', style: AppStyles.semi20Primary),
              )
            : Container(),
      ],
    );
  }
}
