import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_status.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarBadge extends StatelessWidget {
  const CustomAppBarBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return BlocBuilder<CartScreenViewModel, CartScreenStatus>(
      builder: (context, state) {
        var viewModel = CartScreenViewModel.get(context);
        return InkWell(
          onTap: currentRoute != AppRoutes.cartScreenRoute
              ? () {
                  Navigator.pushNamed(context, AppRoutes.cartScreenRoute);
                }
              : null,

          child: Badge(
            alignment: AlignmentDirectional.topStart,
            backgroundColor: AppColors.greenColor,
            label: Text(viewModel.numOfCartItem.toString()),
            child: ImageIcon(
              AssetImage(AppAssets.shoppingCartIcon),
              size: 35.sp,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
