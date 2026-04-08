import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce/features/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passIsObscure = true;

  LoginViewModel viewModel = getIt<LoginViewModel>();
  void login(){
    if(formKey.currentState!.validate()){
      //todo: login logic
      viewModel.login(passwordController.text, emailController.text);

    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(
              context: context, loadingMessage: 'Loading...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context, message: state.errorMessage.message,
              posActionName: 'ok', title: "Error"

          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context,
              message: 'Login Successfully',
              posActionName: 'ok',
              title: "Success",
              posAction: () {
                //SharedPrefsUtils.saveData(key: 'token', value: state.authResponse.token??'');
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              }
          );
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
                      top: 91.h,
                      bottom: 87.h,
                      left: 97.w,
                      right: 96.w
                  ),
                  child: Image.asset(AppAssets.routeLogo),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    spacing: 12.h,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Welcome Back To Route',
                        style: AppStyles.semi24TextWhite,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: AutoSizeText(
                          'User Name',
                          style: AppStyles.medium18Header,
                          maxLines: 1,
                        ),
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
                          hintText: 'enter your email',
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
                        padding: EdgeInsets.only(bottom: 5.h),
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
                      Padding(
                        padding: EdgeInsets.only(left: 266.w),
                        child: InkWell(
                          child: AutoSizeText(
                            'Forgot password',
                            style: AppStyles.regular18White,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h, bottom: 3.h),
                        child: CustomElevatedButton(
                            borderRadius: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                'Login', style: AppStyles.semi20Primary,),
                            ),
                            decorationColor: AppColors.whiteColor,
                            onPressed: () {
                              login();
                            }),
                      ),
                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: "Don’t have an account? ",
                          style: AppStyles.medium18Header,
                          children: [
                            TextSpan(
                              text: "Create Account",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //todo: Navigate to register screen
                                  Navigator.pushNamed(
                                      context, AppRoutes.registerRoute);
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
