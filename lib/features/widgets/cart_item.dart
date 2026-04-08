import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_products.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/features/widgets/add_remove_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  final GetProducts items;

  CartItem({required this.items});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
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
                  imageUrl: widget.items.product?.imageCover ?? "",
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                child: Column(
                  spacing: 20.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          (widget.items.product?.title ?? "")
                              .trim()
                              .split(RegExp(r'\s+'))
                              .take(2)
                              .join(' '),
                          style: AppStyles.medium18Primary,
                        ),
                        InkWell(
                          onTap: () {
                            //todo: delete item from cart
                            context
                                .read<CartScreenViewModel>()
                                .deleteItemInCart(
                                  widget.items.product?.id ?? '',
                                );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Image.asset(AppAssets.deleteIcon),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Egp ${widget.items.price?.toDouble().toString()}',
                          style: AppStyles.medium18PrimaryHeader,
                        ),
                        AddRemoveItem(
                          count: widget.items.count!.toString(),
                          onPressedIncrement: () {
                            context.read<CartScreenViewModel>().incrementCount(
                              widget.items.product?.id ?? '',
                              widget.items.count ?? 1,
                            );
                          },
                          onPressedDecrement: () {
                            context.read<CartScreenViewModel>().decrementCount(
                              widget.items.product?.id ?? '',
                              widget.items.count ?? 1,
                            );
                          },
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
