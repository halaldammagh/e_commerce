import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class AddRemoveItem extends StatelessWidget {
  String count;

  VoidCallback onPressedIncrement;
  VoidCallback onPressedDecrement;

  AddRemoveItem({
    super.key,
    required this.count,
    required this.onPressedIncrement,
    required this.onPressedDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        spacing: 14.w,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: onPressedDecrement,
              child: Image.asset(AppAssets.removeIcon),
            ),
          ),
          Text(count, style: AppStyles.regular18White),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: onPressedIncrement,

              child: Image.asset(AppAssets.addIcon),
            ),
          ),
        ],
      ),
    );
  }
}
