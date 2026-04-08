import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/flutter_toast.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_status.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/products_tab/cubit/product_tab_status.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce/features/widgets/main_error_widget.dart';
import 'package:e_commerce/features/widgets/main_loading_widget.dart';
import 'package:e_commerce/features/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override


  @override
  Widget build(BuildContext context) {
    return BlocListener<CartScreenViewModel, CartScreenStatus>(
      listener: (context, state) {
        if (state is AddProductToCartSuccessState) {
          ToastUtils.toastMessage(
              message: 'Added Successfully',
              backGroundColor: AppColors.greenColor,
              textColor: AppColors.whiteColor);
        } else if (state is AddProductToCartErrorState) {
          ToastUtils.toastMessage(message: state.errorMessage,
              backGroundColor: AppColors.redColor,
              textColor: AppColors.whiteColor);
        }
      },
      child: BlocBuilder<ProductTabViewModel, ProductTabStatus>(
        bloc: viewModel..getAllProducts(),
        //هي بدي ال initState عشان ننادي عالميثود
        builder: (context, state) {
          if (state is ProductErrorState) {
            return MainErrorWidget(errorMessage: state.errorMessage);
          } else if (state is ProductSuccessState) {
            return Scaffold(
              body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.1.h,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                      ),
                      itemCount: viewModel.productList!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //todo: Navigate to product details screen
                            Navigator.pushNamed(
                              context,
                              AppRoutes.productRoute,
                              arguments: viewModel.productList![index],
                            );
                          },
                          child: ProductTabItem(
                            product: viewModel.productList![index],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            );
          }
          else {
            return MainLoadingWidget();
          }
        },
      ),
    );
  }
}
