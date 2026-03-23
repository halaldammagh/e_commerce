import 'dart:ui';

import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/ui/pages/home_screens/home_screen/cubit/home_screen_status.dart';
import 'package:e_commerce/features/ui/pages/home_screens/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int selectedIndex = 0;
  //
  // List<Widget>bodyList = [
  //   HomeTab(),
  //   ProductsTab(),
  //   FavoriteTab(),
  //   UserTab()
  // ];

  // void bottomNavOnTap(int index){
  //   selectedIndex = index;
  //   setState(() {
  //
  //   });
  // }

  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStatus>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              /// الصفحة
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: viewModel.bodyList[viewModel.selectedIndex],
              ),

              /// البوتوم بار
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SizedBox(
                      height: 94,
                      child: BottomNavigationBar(
                        backgroundColor: AppColors.primaryColor.withOpacity(
                          0.8,
                        ),
                        elevation: 0,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: viewModel.selectedIndex,
                        onTap: viewModel.bottomNavOnTap,
                        iconSize: 20.sp,
                        items: [
                          _bottomNavigationBarItem(
                            isSelected: viewModel.selectedIndex == 0,
                            selectedIcon: AppAssets.selectedHomeIcon,
                            unSelectedIcon: AppAssets.unSelectedHomeIcon,
                          ),
                          _bottomNavigationBarItem(
                            isSelected: viewModel.selectedIndex == 1,
                            selectedIcon: AppAssets.selectedCategoryIcon,
                            unSelectedIcon: AppAssets.unSelectedCategoryIcon,
                          ),
                          _bottomNavigationBarItem(
                            isSelected: viewModel.selectedIndex == 2,
                            selectedIcon: AppAssets.selectedFavouriteIcon,
                            unSelectedIcon: AppAssets.unSelectedFavouriteIcon,
                          ),
                          _bottomNavigationBarItem(
                            isSelected: viewModel.selectedIndex == 3,
                            selectedIcon: AppAssets.selectedAccountIcon,
                            unSelectedIcon: AppAssets.unSelectedAccountIcon,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required bool isSelected,
    required String selectedIcon,
    required String unSelectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(isSelected ? selectedIcon : unSelectedIcon),
      label: '',
    );
  }
}
