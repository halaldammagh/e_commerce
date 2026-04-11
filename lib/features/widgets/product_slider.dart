import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSlider extends StatelessWidget {
  final Product product;

  const ProductSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.primary30Opacity, width: 2),
      ),
      child: Stack(
        children: [
          ImageSlideshow(
            indicatorColor: AppColors.primaryColor,
            initialPage: 0,
            indicatorBottomPadding: 15.h,
            indicatorPadding: 8.w,
            indicatorRadius: 5,
            indicatorBackgroundColor: AppColors.whiteColor,
            isLoop: true,
            height: 500.h,
            width: double.infinity,
            children: (product.images ?? []).map((url) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  width: double.infinity,
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
              );
            }).toList(),
          ),
          Positioned(
            top: 2.h,
            right: 2.w,
            child: InkWell(
              onTap: () {},
              child: Image.asset(AppAssets.unSelectedAddToFavouriteIcon),
            ),
          ),
        ],
      ),
    );
  }
}
