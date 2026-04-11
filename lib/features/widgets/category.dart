import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  CategoryOrBrand item;

  Category({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: Colors.grey.shade200,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: item.image ?? '',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: AppColors.primaryColor),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColors.redColor),
            ),
          ),
        ),

        SizedBox(height: 8.h),

        Text(
          item.name ?? "",
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }
}
