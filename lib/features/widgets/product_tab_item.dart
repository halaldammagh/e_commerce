import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_screen_status.dart';

class ProductTabItem extends StatelessWidget {
  final Product product;
  bool isSelected = false;

  ProductTabItem({super.key, required this.product});


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.primary30Opacity, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.redColor),
                ),
              ),
              BlocBuilder<FavoriteTabViewModel, FavoriteScreenStatus>(
                builder: (context, state) {
                  final viewModel = context.read<FavoriteTabViewModel>();

                  final isFav = viewModel.isFavourite(product.id ?? '');

                  return Positioned(
                    top: 2.h,
                    right: 2.w,
                    child: InkWell(
                      onTap: () {
                        viewModel.addProductToFavorite(product.id ?? '');
                      },
                      child: Image.asset(
                        isFav
                            ? AppAssets.selectedAddToFavouriteIcon
                            : AppAssets.unSelectedAddToFavouriteIcon,
                      ),
                    ),
                  );
                },
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.title ?? '',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    AutoSizeText(
                      "EGP ${product.price}",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    AutoSizeText(
                      "EGP ${product.price! * 2}",
                      maxLines: 1,
                      style: AppStyles.regular11SalePrice.copyWith(
                        color: AppColors.discountTextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    AutoSizeText(
                      "Review (${product.ratingsAverage})",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Image.asset(AppAssets.starIcon),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        //todo: add to cart
                        CartScreenViewModel.get(context).addProductToCart(
                            product.id ?? '');
                      },
                      splashColor: AppColors.transParentColor,
                      child: Image.asset(AppAssets.plusIcon),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
