import 'package:e_commerce/features/ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_screen_status.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerce/features/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/main_error_widget.dart';
import '../../../../../widgets/main_loading_widget.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteTabViewModel>().getWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteTabViewModel, FavoriteScreenStatus>(
        builder: (context, state) {
          if (state is AddProductToFavoriteInitialState) {
            return const MainLoadingWidget();
          }

          if (state is GetProductInWishlistErrorState) {
            return MainErrorWidget(errorMessage: state.errorMessage);
          }

          if (state is GetProductInWishlistSuccessState) {
            final items = state.getWishlistResponse.data ?? [];

            if (items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 60,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your Wish List is empty',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tap the heart icon to save items you love.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 150.h,)
                  ],

                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 80.h),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return FavoriteItem(
                    key: ValueKey(items[index].id),
                    items: items[index],
                  );
                },
              ),
            );
          }

          return const MainLoadingWidget();
        },
      ),
    );
  }
}