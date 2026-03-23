import 'package:e_commerce/features/ui/pages/home_screens/home_screen/cubit/home_screen_status.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/products_tab/products_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/user_tab/user_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStatus> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  //todo : hold data and handle logic

  int selectedIndex = 0;
  List<Widget> bodyList = [HomeTab(), ProductsTab(), FavoriteTab(), UserTab()];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(HomeScreenChangeSelectedIndexState());
  }
}
