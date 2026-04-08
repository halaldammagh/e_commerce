import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce/features/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



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
  TextEditingController rePasswordController = TextEditingController();
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  var formKey = GlobalKey<FormState>();
  bool passIsObscure = true;
  bool rePassIsObscure = true;

  void register() {
    if(formKey.currentState!.validate()){
      //todo: login logic
      viewModel.register(password: passwordController.text,
          email: emailController.text,
          phone: mobileNumberController.text,
          name: userNameController.text,
          rePassword: rePasswordController.text
      );


    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(
              context: context, loadingMessage: 'Waiting...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context,
              message: state.errorMessage.message,
              posActionName: 'ok',
              title: 'Error');
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'ok',
              posAction: () {
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 46.9.h,
                      bottom: 46.9.h,
                      left: 97.w,
                      right: 96.w
                  ),
                  child: Image.asset(AppAssets.routeLogo),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    spacing: 8.h,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      AutoSizeText(
                        'Full Name',
                        style: AppStyles.medium18Header,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
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
                        style: AppStyles.medium18Header,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CustomTextFormField(
                          errorStyle: TextStyle(
                            color: AppColors.redColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          validator: (vale) {
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
                        style: AppStyles.medium18Header,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CustomTextFormField(
                          errorStyle: TextStyle(
                            color: AppColors.redColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          validator: (vale) {
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
                        style: AppStyles.medium18Header,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CustomTextFormField(
                          errorStyle: TextStyle(
                            color: AppColors.redColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          obscureText: passIsObscure ? true : false,
                          validator: (vale) {
                            return AppValidators.validatePassword(vale);
                          },
                          controller: passwordController,
                          suffixIcon: InkWell(
                              onTap: () {
                                passIsObscure = !passIsObscure;
                                setState(() {});
                              },
                              child: Image.asset(passIsObscure ?
                              AppAssets.hideEyeIcon : AppAssets.eyeIcon
                              )),
                          hintText: 'enter your password',
                          hintStyle: AppStyles.lightHintText,
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          borderSideColor: AppColors.whiteColor,
                        ),
                      ),
                      AutoSizeText(
                        'rePassword',
                        style: AppStyles.medium18Header,
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
                          obscureText: rePassIsObscure ? true : false,
                          validator: (vale) {
                            return AppValidators.validateConfirmPassword(
                                passwordController.text, vale);
                          },
                          controller: rePasswordController,
                          suffixIcon: InkWell(
                              onTap: () {
                                rePassIsObscure = !rePassIsObscure;
                                setState(() {});
                              },
                              child: Image.asset(passIsObscure ?
                              AppAssets.hideEyeIcon : AppAssets.eyeIcon
                              )),
                          hintText: 'conform your password',
                          hintStyle: AppStyles.lightHintText,
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          borderSideColor: AppColors.whiteColor,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: CustomElevatedButton(
                            borderRadius: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                'Sign up', style: AppStyles.semi20Primary,),
                            ),
                            decorationColor: AppColors.whiteColor,
                            onPressed: () {
                              register();
                            }),
                      ),

                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: "Already have an account? ",
                          style: AppStyles.medium18Header,
                          children: [
                            TextSpan(
                              text: "Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //todo: Navigate to login screen
                                  Navigator.pushNamed(
                                      context, AppRoutes.loginRoute);
                                },
                            ),
                          ],
                        ),
                      )


                    ],
                  ),
                )

              ],
            ),
          ),
        )),

      ),
    );
  }
}
