// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce/api/api_services.dart' as _i657;
import 'package:e_commerce/api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i994;
import 'package:e_commerce/api/data_sources/remote/brand/brand_remote_data_source_impl.dart'
    as _i748;
import 'package:e_commerce/api/data_sources/remote/cart/cart_remote_data_source_impl.dart'
    as _i69;
import 'package:e_commerce/api/data_sources/remote/cart/get_cart_remote_data_source_impl.dart'
    as _i17;
import 'package:e_commerce/api/data_sources/remote/category/category_remote_data_source_impl.dart'
    as _i1053;
import 'package:e_commerce/api/data_sources/remote/product/product_remote_data_source_impl.dart'
    as _i507;
import 'package:e_commerce/api/data_sources/remote/wishlist/wishlist_remote_data_source_impl.dart'
    as _i770;
import 'package:e_commerce/api/dio/get_it_%20module.dart' as _i895;
import 'package:e_commerce/data/data_sources/remote/auth/auth_remote_data_source.dart'
    as _i610;
import 'package:e_commerce/data/data_sources/remote/brand/brand_remote_data_source.dart'
    as _i983;
import 'package:e_commerce/data/data_sources/remote/cart/cart_remote_data_source.dart'
    as _i895;
import 'package:e_commerce/data/data_sources/remote/cart/get_cart_remote_data_source.dart'
    as _i523;
import 'package:e_commerce/data/data_sources/remote/category/category_remote_data_source.dart'
    as _i888;
import 'package:e_commerce/data/data_sources/remote/product/product_remote_data_source.dart'
    as _i673;
import 'package:e_commerce/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart'
    as _i443;
import 'package:e_commerce/data/repository/auth/auth_repository_impl.dart'
    as _i376;
import 'package:e_commerce/data/repository/brand/brand_repository_impl.dart'
    as _i520;
import 'package:e_commerce/data/repository/cart/cart_repository_impl.dart'
    as _i448;
import 'package:e_commerce/data/repository/cart/get_cart_repository_impl.dart'
    as _i607;
import 'package:e_commerce/data/repository/category/category_repository_impl.dart'
    as _i534;
import 'package:e_commerce/data/repository/product/product_repository_impl.dart'
    as _i361;
import 'package:e_commerce/data/repository/wishlist/wishlist_repository_impl.dart'
    as _i752;
import 'package:e_commerce/domain/repository/auth/auth_repository.dart'
    as _i491;
import 'package:e_commerce/domain/repository/brand/brand_repository.dart'
    as _i579;
import 'package:e_commerce/domain/repository/cart/cart_repository.dart'
    as _i373;
import 'package:e_commerce/domain/repository/cart/get_cart_repository.dart'
    as _i214;
import 'package:e_commerce/domain/repository/category/category_repository.dart'
    as _i464;
import 'package:e_commerce/domain/repository/product/product_repository.dart'
    as _i426;
import 'package:e_commerce/domain/repository/wishlist/wishlist_repository.dart'
    as _i744;
import 'package:e_commerce/domain/use_cases/add_product_to_wishlist_use_case.dart'
    as _i642;
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart' as _i884;
import 'package:e_commerce/domain/use_cases/delete_item_in_cart_use_case.dart'
    as _i728;
import 'package:e_commerce/domain/use_cases/delete_products_from_wishlist_use_case.dart'
    as _i254;
import 'package:e_commerce/domain/use_cases/get_all_brand_use_case.dart'
    as _i487;
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart'
    as _i920;
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart'
    as _i617;
import 'package:e_commerce/domain/use_cases/get_cart_use_case.dart' as _i786;
import 'package:e_commerce/domain/use_cases/get_products_in_wishlist_use_case.dart'
    as _i900;
import 'package:e_commerce/domain/use_cases/login_use_case.dart' as _i186;
import 'package:e_commerce/domain/use_cases/register_use_case.dart' as _i883;
import 'package:e_commerce/domain/use_cases/update_count_in_cart_use_case.dart'
    as _i496;
import 'package:e_commerce/features/ui/auth/login/cubit/login_view_model.dart'
    as _i955;
import 'package:e_commerce/features/ui/auth/register/cubit/register_view_model.dart'
    as _i451;
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_view_model.dart'
    as _i753;
import 'package:e_commerce/features/ui/pages/home_screens/home_screen/cubit/home_screen_view_model.dart'
    as _i921;
import 'package:e_commerce/features/ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_tab_view_model.dart'
    as _i437;
import 'package:e_commerce/features/ui/pages/home_screens/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i374;
import 'package:e_commerce/features/ui/pages/home_screens/tabs/products_tab/cubit/product_tab_view_model.dart'
    as _i230;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart' as _i59;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i921.HomeScreenViewModel>(() => _i921.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.singleton<_i59.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.singleton<_i657.ApiServices>(() => getItModule.apiServices);
    gh.factory<_i983.BrandRemoteDataSource>(
      () => _i748.BrandRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.factory<_i579.BrandRepository>(
      () => _i520.BrandRepositoryImpl(gh<_i983.BrandRemoteDataSource>()),
    );
    gh.factory<_i443.WishlistRemoteDataSource>(
      () => _i770.WishlistRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i59.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i523.GetCartRemoteDataSource>(
      () => _i17.GetCartRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.factory<_i895.CartRemoteDataSource>(
      () => _i69.CartRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.factory<_i673.ProductRemoteDataSource>(
      () => _i507.ProductRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.factory<_i744.WishlistRepository>(
      () => _i752.WishlistRepositoryImpl(gh<_i443.WishlistRemoteDataSource>()),
    );
    gh.factory<_i610.AuthRemoteDataSource>(
      () => _i994.AuthRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.factory<_i888.CategoryRemoteDataSource>(
      () => _i1053.CategoryRemoteDataSourceImpl(gh<_i657.ApiServices>()),
    );
    gh.factory<_i642.AddProductToWishlistUseCase>(
      () => _i642.AddProductToWishlistUseCase(gh<_i744.WishlistRepository>()),
    );
    gh.factory<_i254.DeleteProductsFromWishlistUseCase>(
      () => _i254.DeleteProductsFromWishlistUseCase(
        gh<_i744.WishlistRepository>(),
      ),
    );
    gh.factory<_i900.GetProductsInWishlistUseCase>(
      () => _i900.GetProductsInWishlistUseCase(gh<_i744.WishlistRepository>()),
    );
    gh.factory<_i373.CartRepository>(
      () => _i448.CartRepositoryImpl(gh<_i895.CartRemoteDataSource>()),
    );
    gh.factory<_i487.GetAllBrandUseCase>(
      () => _i487.GetAllBrandUseCase(gh<_i579.BrandRepository>()),
    );
    gh.factory<_i728.DeleteItemInCartUseCase>(
      () => _i728.DeleteItemInCartUseCase(gh<_i373.CartRepository>()),
    );
    gh.factory<_i496.UpdateCountInCartUseCase>(
      () => _i496.UpdateCountInCartUseCase(gh<_i373.CartRepository>()),
    );
    gh.factory<_i884.AddToCartUseCase>(
      () => _i884.AddToCartUseCase(gh<_i373.CartRepository>()),
    );
    gh.factory<_i464.CategoryRepository>(
      () => _i534.CategoryRepositoryImpl(gh<_i888.CategoryRemoteDataSource>()),
    );
    gh.factory<_i426.ProductRepository>(
      () => _i361.ProductRepositoryImpl(gh<_i673.ProductRemoteDataSource>()),
    );
    gh.factory<_i214.GetCartRepository>(
      () => _i607.GetCartRepositoryImpl(gh<_i523.GetCartRemoteDataSource>()),
    );
    gh.factory<_i920.GetAllCategoriesUseCase>(
      () => _i920.GetAllCategoriesUseCase(gh<_i464.CategoryRepository>()),
    );
    gh.factory<_i617.GetAllProductsUseCase>(
      () => _i617.GetAllProductsUseCase(gh<_i426.ProductRepository>()),
    );
    gh.factory<_i491.AuthRepository>(
      () => _i376.AuthRepositoryImpl(gh<_i610.AuthRemoteDataSource>()),
    );
    gh.factory<_i437.FavoriteTabViewModel>(
      () => _i437.FavoriteTabViewModel(
        gh<_i642.AddProductToWishlistUseCase>(),
        gh<_i900.GetProductsInWishlistUseCase>(),
        gh<_i254.DeleteProductsFromWishlistUseCase>(),
      ),
    );
    gh.factory<_i374.HomeTabViewModel>(
      () => _i374.HomeTabViewModel(
        gh<_i920.GetAllCategoriesUseCase>(),
        gh<_i487.GetAllBrandUseCase>(),
      ),
    );
    gh.factory<_i786.GetCartUseCase>(
      () => _i786.GetCartUseCase(gh<_i214.GetCartRepository>()),
    );
    gh.factory<_i186.LoginUseCase>(
      () => _i186.LoginUseCase(gh<_i491.AuthRepository>()),
    );
    gh.factory<_i883.RegisterUseCase>(
      () => _i883.RegisterUseCase(gh<_i491.AuthRepository>()),
    );
    gh.factory<_i230.ProductTabViewModel>(
      () => _i230.ProductTabViewModel(gh<_i617.GetAllProductsUseCase>()),
    );
    gh.factory<_i753.CartScreenViewModel>(
      () => _i753.CartScreenViewModel(
        gh<_i884.AddToCartUseCase>(),
        gh<_i786.GetCartUseCase>(),
        gh<_i496.UpdateCountInCartUseCase>(),
        gh<_i728.DeleteItemInCartUseCase>(),
      ),
    );
    gh.factory<_i451.RegisterViewModel>(
      () => _i451.RegisterViewModel(gh<_i883.RegisterUseCase>()),
    );
    gh.factory<_i955.LoginViewModel>(
      () => _i955.LoginViewModel(gh<_i186.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i895.GetItModule {}
