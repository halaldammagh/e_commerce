import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/get_all_brand_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/home_tab/cubit/home_tab_status.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStatus> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllBrandUseCase _getAllBrandsUseCase;

  HomeTabViewModel(this._getAllCategoriesUseCase, this._getAllBrandsUseCase)
    : super(HomeTabInitialState());

  HomeTabSuccessState successState = HomeTabSuccessState();

  //todo: hold data and handle logic

  void getCategories() async {
    try {
      emit(CategoryLoadingState());
      var categoriesList = await _getAllCategoriesUseCase.invoke();
      emit(successState = successState.copyWith(categoryList: categoriesList));
    } on AppExceptions catch (e) {
      emit(CategoryErrorState(errorMessage: e.message));
    }
  }

  Future<void> getBrands() async {
    try {
      emit(BrandsLoadingState());
      var brandsList = await _getAllBrandsUseCase.invoke();
      emit(successState = successState.copyWith(brandsList: brandsList));
    } on AppExceptions catch (e) {
      emit(BrandsErrorState(errorMessage: e.message));
    }
  }
}
