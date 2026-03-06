import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passIsObscure = true;


  void login(){
    if(formKey.currentState!.validate()){
      //todo: login logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.primaryColor,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 85.h,
                  bottom: 46.9.h,
                  left: 97.w,
                  right:96.w
              ),
              child:  Image.asset(AppAssets.routeLogo),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                spacing: 24.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  AutoSizeText(
                      'Full Name',
                      style:AppStyles.medium18Header,
                      maxLines: 1,
                    ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: CustomTextFormField(
                      errorStyle: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),

                      validator: (vale) {
                        return AppValidators.validateFullName(vale);
                      },
                      controller: userNameController,
                      hintText: 'enter your name',
                      hintStyle: AppStyles.lightHintText,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      borderSideColor: AppColors.whiteColor,
                    ),
                  ),
                  AutoSizeText(
                    'Mobile Number',
                    style:AppStyles.medium18Header,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: CustomTextFormField(
                      errorStyle: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (vale){
                        return AppValidators.validatePhoneNumber(vale);
                      },
                      controller: mobileNumberController,
                      hintText: 'enter your mobile no.',
                      hintStyle: AppStyles.lightHintText,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      borderSideColor: AppColors.whiteColor,
                    ),
                  ),
                  AutoSizeText(
                    'E-mail address',
                    style:AppStyles.medium18Header,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: CustomTextFormField(
                      errorStyle: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (vale){
                        return AppValidators.validateEmail(vale);
                      },
                      controller: emailController,
                      hintText: 'enter your email address',
                      hintStyle: AppStyles.lightHintText,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      borderSideColor: AppColors.whiteColor,
                    ),
                  ),
                  AutoSizeText(
                    'Password',
                    style:AppStyles.medium18Header,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32.h),
                    child: CustomTextFormField(
                      errorStyle: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      obscureText: passIsObscure?true:false,
                      validator: (vale){
                        return AppValidators.validatePassword(vale);
                      },
                      controller: passwordController,
                      suffixIcon: InkWell(
                          onTap: (){
                            passIsObscure = !passIsObscure;
                            setState(() {
                            });
                          },
                          child: Image.asset(passIsObscure?
                          AppAssets.hideEyeIcon:AppAssets.eyeIcon
                          )),
                      hintText: 'enter your password',
                      hintStyle: AppStyles.lightHintText,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      borderSideColor: AppColors.whiteColor,
                    ),
                  ),

                  CustomElevatedButton(
                      child:Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text('Sign up',style: AppStyles.semi20Primary,),
                      ),
                      decorationColor: AppColors.whiteColor,
                      onPressed: (){
                      }),







                ],
              ),
            )

          ],
        ),
      )),

    );
  }
}
