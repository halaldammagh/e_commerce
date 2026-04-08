import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_status.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/features/widgets/cart_item.dart';
import 'package:e_commerce/features/widgets/custom_app_bar_badge.dart';
import 'package:e_commerce/features/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/widgets/main_error_widget.dart';
import 'package:e_commerce/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartScreenViewModel.get(context).getItemsInCart();
  }

  @override
  Widget build(BuildContext context) {
    CartScreenViewModel viewModel = CartScreenViewModel.get(context);
    // TODO: implement build
    return Scaffold(
      appBar: _customAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 98.h),
        child: BlocBuilder<CartScreenViewModel, CartScreenStatus>(
          bloc: viewModel..numOfCartItem,
          builder: (context, state) {
            if (state is GetItemInCartErrorState) {
              return MainErrorWidget(errorMessage: state.errorMessage);
            } else if (state is GetItemInCartSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.productsList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          items: state.getCartResponse.data!.products![index],
                        );
                      },
                    ),
                  ),
                  _buildCheckOut(
                    state.getCartResponse.data?.totalCartPrice?.toDouble() ?? 0,
                  ),
                ],
              );
            } else {
              return MainLoadingWidget();
            }
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.transParentColor,
      toolbarHeight: 50.h,
      centerTitle: true,
      elevation: 0,
      title: Text('Cart'),
      backgroundColor: AppColors.transParentColor,
      foregroundColor: AppColors.primaryColor,
      titleTextStyle: AppStyles.semi20Primary,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            onTap: () {},
            child: Image.asset(AppAssets.searchIcon, width: 23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0.h, right: 8.w),
          child: CustomAppBarBadge(),
        ),
      ],
    );
  }

  Widget _buildCheckOut(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText('Total price', style: AppStyles.medium18LightHeader),
            AutoSizeText(
              'EGP ${price}',
              style: AppStyles.medium18PrimaryHeader,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: CustomElevatedButton(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 45.w),
                  child: Text('Check Out', style: AppStyles.regular18White),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 15, right: 45.w),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            decorationColor: AppColors.primaryColor,
            onPressed: () {},
            borderRadius: 45.r,
          ),
        ),
      ],
    );
  }
}
