import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingMessage,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 10.w),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  loadingMessage,
                  style: AppStyles.medium18Primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction!=null){
            //   posAction.call();
            // }
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: AppStyles.medium18Primary,
          ),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction!=null){
            //   posAction.call();
            // }
            negAction?.call();
          },
          child: Text(
            negActionName,
              style: AppStyles.medium18Primary
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message,
            style: AppStyles.medium15Primary,
          ),
          title: Text(
            title!,
            style: AppStyles.medium15Primary,
          ),
          actions: actions,
        );
      },
    );
  }
}
