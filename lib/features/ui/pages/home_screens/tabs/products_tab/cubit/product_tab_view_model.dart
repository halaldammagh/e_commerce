import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/products_tab/cubit/product_tab_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStatus> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  late List<Product>? productList;

  static ProductTabViewModel get(context) =>
      BlocProvider.of<ProductTabViewModel>(context);

  ProductTabViewModel(this._getAllProductsUseCase)
    : super(ProductLoadingState());

  void getAllProducts() async {
    try {
      emit(ProductLoadingState());
      var productsList = await _getAllProductsUseCase.invoke();
      productList = productsList;
      emit(ProductSuccessState(productList: productsList));
    } on AppExceptions catch (e) {
      emit(ProductErrorState(errorMessage: e.message));
    }
  }
}
