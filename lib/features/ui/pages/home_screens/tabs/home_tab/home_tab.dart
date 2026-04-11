import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/home_tab/cubit/home_tab_status.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce/features/widgets/brand.dart';
import 'package:e_commerce/features/widgets/category.dart';
import 'package:e_commerce/features/widgets/main_error_widget.dart';
import 'package:e_commerce/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getCategories();
    viewModel.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 156.h),
            _buildAnnouncement(
              images: [AppAssets.Banner1, AppAssets.Banner2, AppAssets.Banner3],
            ),
            SizedBox(height: 24.h),
            Container(
              height: 320.h,
              child: Column(
                children: [
                  _lineBreak(name: 'Categories'),
                  BlocBuilder<HomeTabViewModel, HomeTabStatus>(
                    bloc: viewModel,
                    builder: (context, state) {
                      if (state is CategoryErrorState) {
                        return MainErrorWidget(
                          errorMessage: state.errorMessage,
                          onPressed: () {
                            viewModel.getCategories();
                          },
                        );
                      } else if (state is HomeTabSuccessState) {
                        return _buildCategorySec(
                          list: state.categoryList ?? [],
                        );
                      } else {
                        //todo: loading
                        return MainLoadingWidget();
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                height: 250.h,
                padding: EdgeInsets.all(1.r),
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withOpacity(0.08), // 🔥 مهم جداً
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.01),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: _lineBreak(name: 'Brands'),
                    ),
                    // AnimatedScale(
                    // scale: isPressed ? 0.96 : 1,
                    //  duration: Duration(milliseconds: 150),
                    //child:
                    BlocBuilder<HomeTabViewModel, HomeTabStatus>(
                      bloc: viewModel,
                      builder: (context, state) {
                        if (state is BrandsErrorState) {
                          return MainErrorWidget(
                            errorMessage: state.errorMessage,
                            onPressed: () {
                              viewModel.getBrands();
                            },
                          );
                        } else if (state is HomeTabSuccessState) {
                          return _buildBrandSec(list: state.brandsList ?? []);
                        } else {
                          return MainLoadingWidget();
                        }
                      },
                    ),
                    //    ),
                  ],
                ),
              ),
            ),
            Container(height: 100.h),
          ],
        ),
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {},
          child: Text('View all', style: AppStyles.regular12Text),
        ),
      ],
    );
  }

  SizedBox _buildCategorySec({required List<CategoryOrBrand> list}) {
    return SizedBox(
      height: 260.h,
      width: double.infinity,
      child: GridView.builder(
        padding: EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          //  mainAxisSpacing: 8.w
        ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return Category(item: list[index]);
        },
      ),
    );
  }

  SizedBox _buildBrandSec({required List<CategoryOrBrand> list}) {
    return SizedBox(
      height: 180.h,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 20.w,
          childAspectRatio: 0.6, // 🔥 مهم جداً
        ),
        itemBuilder: (context, index) {
          return Brand(item: list[index]);
        },
      ),
    );
  }
}
