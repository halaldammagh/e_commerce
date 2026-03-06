import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:AppRoutes.loginRoute,
          routes: {
           AppRoutes.loginRoute: (context) => LoginScreen(),
           AppRoutes.registerRoute: (context) => RegisterScreen(),
           // AppRoutes.homeRoute : (context)=> const ,
           // AppRoutes.cartRoute : (context)=> const
           // AppRoutes.productRoute : (context)=>
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}


