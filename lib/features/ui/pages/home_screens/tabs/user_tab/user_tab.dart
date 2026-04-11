import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/user_tab/cubit/user_tab_status.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/user_tab/cubit/user_tab_view_model.dart';
import 'package:e_commerce/features/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/widgets/main_error_widget.dart';
import 'package:e_commerce/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserTabViewModel>().getUserToken();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTabViewModel, UserTabStatus>(
      builder: (context, state) {
        if (state is GetUserLoadingState) {
          return MainLoadingWidget();
        }

        if (state is GetUserErrorState) {
          return MainErrorWidget(errorMessage: state.errorMessage);
        }

        if (state is GetUserSuccessState) {
          final user = state.verifyResponse.decoded; // 🔥 أهم سطر

          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  spacing: 30.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText('Welcome, ${user?.name ?? ''}',
                              style: AppStyles.medium18PrimaryHeader,),
                            IconButton(onPressed: () {
                              //todo: remove token
                              SharedPrefsUtils.removeData(key: 'token');
                              //todo: Navigate to login screen
                              Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.loginRoute, (
                                  route) => false,);
                            },
                                icon: Icon(
                                  Icons.logout, color: AppColors.redColor,))
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: AutoSizeText(
                              SharedPrefsUtils.getData(
                                  key: 'email') as String? ?? '',
                              style: AppStyles.medium14LightPrimary,
                            )
                        ),


                      ],
                    ),
                    _buildTextFieldItems(
                        onPressed: () {},
                        labelText: 'Your full name',
                        controller: TextEditingController(
                            text: user?.name ?? '')),
                    _buildTextFieldItems(onPressed: () {},
                        labelText: 'Your E-mail',
                        controller: TextEditingController(
                          text: SharedPrefsUtils.getData(
                              key: 'email') as String? ?? '',)),
                    _buildTextFieldItems(
                        onPressed: () {},
                        labelText: 'Your password',
                        controller: TextEditingController(
                            text: '************')),
                    _buildTextFieldItems(
                        onPressed: () {},
                        labelText: 'Your mobile number',
                        controller: TextEditingController(text: '01124587951')),
                    _buildTextFieldItems(onPressed: () {},
                        labelText: 'Your Address',
                        controller: TextEditingController(
                            text: '6th October, street 11.....')),

                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },

    );

  }

  Widget _buildTextFieldItems(
      {TextEditingController? controller, required VoidCallback onPressed,
        bool obscureText = false, String obscuringCharacter = "*", required String labelText
      }) {
    return Column(
      spacing: 5.h,
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

        )

      ],
    );
  }
}
