import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/my_bloc_observer.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cart_screen.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screens/home_screen/home_screen.dart';
import 'package:e_commerce/features/ui/pages/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'features/ui/pages/home_screens/tabs/user_tab/cubit/user_tab_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPrefsUtils.init();
  String routeName = '';
  var token = SharedPrefsUtils.getData(key: 'token');
  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    routeName = AppRoutes.homeRoute;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FavoriteTabViewModel>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartScreenViewModel>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserTabViewModel>(),
        ),
      ],
      child: MyApp(routeName: routeName,)));

}

class MyApp extends StatelessWidget {
  String routeName;

  MyApp({required this.routeName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
           AppRoutes.loginRoute: (context) => LoginScreen(),
           AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.cartScreenRoute: (context) => CartScreen(),
            AppRoutes.productRoute: (context) => ProductDetailsScreen()
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}



