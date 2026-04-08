import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 22.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText('Welcome, Mohamed',
                        style: AppStyles.medium18PrimaryHeader,),
                      IconButton(onPressed: () {
                        //todo: remove token
                        SharedPrefsUtils.removeData(key: 'token');
                        //todo: Navigate to login screen
                        Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.loginRoute, (route) => false,);
                      }, icon: Icon(Icons.logout, color: AppColors.redColor,))
                    ],
                  ),
                  AutoSizeText('mohamed.N@gmail.com',
                    style: AppStyles.medium14LightPrimary,),


                ],
              ),
              _buildTextFieldItems(
                  onPressed: () {}, labelText: 'Your full name'),
              _buildTextFieldItems(onPressed: () {}, labelText: 'Your E-mail'),
              _buildTextFieldItems(
                  onPressed: () {}, labelText: 'Your password'),
              _buildTextFieldItems(
                  onPressed: () {}, labelText: 'Your mobile number'),
              _buildTextFieldItems(onPressed: () {}, labelText: 'Your Address'),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldItems(
      {TextEditingController? controller, required VoidCallback onPressed,
        bool obscureText = false, String obscuringCharacter = "*", required String labelText
      }) {
    return Column(
      spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(labelText, style: AppStyles.medium18PrimaryHeader,),
        CustomTextFormField(
            obscureText: obscureText,
            obscuringCharacter: obscuringCharacter,
            controller: controller,
            horizontalPadding: 12,
            verticalPadding: 13,
            borderSideColor: AppColors.primary30Opacity,
            errorStyle: TextStyle(
              color: AppColors.redColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: InkWell(
                onTap: onPressed,
                child: Image.asset(AppAssets.editIcon))
        )

      ],
    );
  }
}
