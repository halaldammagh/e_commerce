import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 0;
  double totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (args.title ?? '')
              .trim()
              .split(RegExp(r'\s+'))
              .take(2)
              .join(' '),
          style: AppStyles.semi20Primary,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
                onTap: () {},
                child: Image.asset(AppAssets.searchIcon, width: 24)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {},
                child: Image.asset(AppAssets.shoppingCartIcon, width: 24)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w, right: 16.w, top: 16.h, bottom: 24.h,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(product: args),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(args.title ?? "",
                      style: AppStyles.medium18Header,),
                  ),
                  SizedBox(width: 15.w,),
                  Text('EGP ${args.price}', style: AppStyles.medium18Header,)
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(20.r),

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w,
                        vertical: 8.h),
                    child: Text("${args.sold} Sold",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.medium14PrimaryDark,
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Image.asset(AppAssets.starIcon, width: 20.w,),
                  SizedBox(width: 4.w,),
                  Expanded(child: Text(
                    "${args.ratingsAverage} (${args.ratingsQuantity})",
                    style: AppStyles.medium14PrimaryDark,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      spacing: 14.w,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (productCounter != 0) {
                                productCounter--;
                                //todo: get unit price first
                                //assuming unit prise is 500
                                totalPrice -= 500;
                                setState(() {

                                });
                              }
                            },
                            child: Image.asset(AppAssets.removeIcon),
                          ),
                        ),
                        Text(
                          '$productCounter', style: AppStyles.regular18White,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              productCounter++;
                              //todo: get unit price first
                              //assuming unit prise is 500
                              totalPrice += 500;
                              setState(() {

                              });
                            },
                            child: Image.asset(AppAssets.addIcon),
                          ),
                        )
                      ],
                    ),

                  )
                ],
              ),
              SizedBox(height: 8.h,),
              Text('Description', style: AppStyles.medium18Header),
              SizedBox(height: 8.h,),
              ReadMoreText(
                args.description ?? '',
                style: AppStyles.medium14LightPrimary,
                trimExpandedText: ' Read Less ',
                trimCollapsedText: ' Read More ',
                trimLines: 2,
                trimMode: TrimMode.Line,
                colorClickableText: AppColors.primaryColor,
              ),
              SizedBox(height: 26.h,),
              _buildPriceSection()
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildPriceSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total price', style: AppStyles.medium18LightHeader,),
            Text('EGP ${totalPrice}', style: AppStyles.medium18Header,)

          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: CustomElevatedButton(
            child: Row(
              children: [

                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Image.asset(AppAssets.addToCartIcon),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 79, left: 24),
                  child: Text('Add to cart', style: AppStyles.regular18White,),
                )
              ],),
            decorationColor: AppColors.primaryColor,
            onPressed: () {},
            borderRadius: 45.r,

          ),
        )


      ],
    );
  }
}
