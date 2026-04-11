import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllProducts();
  }

  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel, ProductTabStatus>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductErrorState) {
          return MainErrorWidget(errorMessage: state.errorMessage);
        } else if (state is ProductSuccessState) {
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 121.h),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.1.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.productList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //todo: Navigate to product details screen
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productRoute,
                            arguments: state.productList![index],
                          );
                        },
                        child: ProductTabItem(
                          product: state.productList![index],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          );
        } else {
          return MainLoadingWidget();
        }
      },
    );
  }
}
