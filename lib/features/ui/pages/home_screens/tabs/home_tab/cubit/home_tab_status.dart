import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';

abstract class HomeTabStatus {}

class HomeTabInitialState extends HomeTabStatus {}

class CategoryLoadingState extends HomeTabStatus {}

class CategoryErrorState extends HomeTabStatus {
  String errorMessage;

  CategoryErrorState({required this.errorMessage});
}
// class CategorySuccessState extends HomeTabStatus{
//   List<CategoryOrBrand>? categoryList;
//   CategorySuccessState({required this.categoryList});
// }

class BrandsLoadingState extends HomeTabStatus {}

class BrandsErrorState extends HomeTabStatus {
  String errorMessage;

  BrandsErrorState({required this.errorMessage});
}
// class BrandsSuccessState extends HomeTabStatus{
//   List<CategoryOrBrand>? brandsList;
//   BrandsSuccessState({required this.brandsList});
// }

class HomeTabSuccessState extends HomeTabStatus {
  List<CategoryOrBrand>? categoryList;
  List<CategoryOrBrand>? brandsList;

  HomeTabSuccessState({this.categoryList, this.brandsList});

  HomeTabSuccessState copyWith({
    List<CategoryOrBrand>? categoryList,
    List<CategoryOrBrand>? brandsList,
  }) {
    return HomeTabSuccessState(
      categoryList: categoryList ?? this.categoryList,
      brandsList: brandsList ?? this.brandsList,
    );
  }
}
