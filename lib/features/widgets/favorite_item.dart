import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'custom_elevated_button.dart';

class FavoriteItem extends StatelessWidget {
  final GetWishlist items;

  FavoriteItem({Key? key, required this.items}) : super(key: key);

  int productCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        height: 113.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: BoxBorder.all(color: AppColors.primary30Opacity, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border(
                  right: BorderSide(color: AppColors.primary30Opacity),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15.r),
                child: CachedNetworkImage(
                  height: 113.h,
                  width: 120.w,
                  imageUrl: items.imageCover ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade200,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error, color: Colors.red)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          (items.title ?? '')
                              .trim()
                              .split(RegExp(r'\s+'))
                              .take(3)
                              .join(' '),
                          style: AppStyles.medium18Primary,
                        ),

                        InkWell(
                          onTap: () {
                            context.read<FavoriteTabViewModel>().deleteWishlist(
                              items.id ?? '',
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: Image.asset(
                              AppAssets.selectedAddToFavouriteIcon,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Egp ${items.price?.toDouble().toString()}',
                          style: AppStyles.medium18PrimaryHeader,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 15.w),
                          child: AutoSizeText(
                            "EGP ${items.price! * 2}",
                            maxLines: 1,
                            style: AppStyles.regular11SalePrice.copyWith(
                              color: AppColors.discountTextColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),

                        CustomElevatedButton(
                          height: 10,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w, left: 8.w),
                            child: Text(
                              'Add to cart',
                              style: AppStyles.regular16White,
                            ),
                          ),
                          decorationColor: AppColors.primaryColor,
                          onPressed: () {
                            context
                                .read<CartScreenViewModel>()
                                .addProductToCart(items.id ?? '');
                          },
                          borderRadius: 15.r,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
