import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Brand extends StatelessWidget {
  CategoryOrBrand item;

  Brand({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // 🔥 بدل الأزرق
            blurRadius: 6,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: item.image ?? '',
        fit: BoxFit.contain,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
        errorWidget: (context, url, error) =>
            Icon(Icons.error, color: AppColors.redColor),
      ),
    );
  }
}
