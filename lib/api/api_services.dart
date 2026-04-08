import 'package:dio/dio.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/api/model/request/cart/add/add_cart_request_dto.dart';
import 'package:e_commerce/api/model/request/cart/update/count_request_dto.dart';
import 'package:e_commerce/api/model/request/login/login_request_dto.dart';
import 'package:e_commerce/api/model/request/register/register_request_dto.dart';
import 'package:e_commerce/api/model/request/wishlist/add_wishlist_request_dto.dart';
import 'package:e_commerce/api/model/response/auth/auth_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/add/add_product_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/category_brand/category_or_brand_response_dto.dart';
import 'package:e_commerce/api/model/response/product/product_response_dto.dart';
import 'package:e_commerce/api/model/response/wishlist/add/add_wishlist_response_dto.dart';
import 'package:e_commerce/api/model/response/wishlist/delete/delete_wishlist_response_dto.dart';
import 'package:e_commerce/api/model/response/wishlist/get/get_wishlist_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';


@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;


  @POST(EndPoints.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);

  @GET(EndPoints.categoriesApi)
  Future<CategoryOrBrandResponseDto> getAllCategories();

  @GET(EndPoints.brandsApi)
  Future<CategoryOrBrandResponseDto> getAllBrands();

  @GET(EndPoints.productsApi)
  Future<ProductResponseDto> getAllProducts();

  @GET(EndPoints.addCartApi)
  Future<GetCartResponseDto> getItemsInCart(@Header('token') String token);

  @POST(EndPoints.addCartApi)
  Future<AddProductCartResponseDto> addProductToCart(
      @Body() AddCartRequestDto addCart,
      @Header('token') String token);


  @DELETE(EndPoints.deleteCartApi)
  Future<GetCartResponseDto> deleteItemInCart(
      @Path('productId') String productId,
      @Header('token') String token);

  @PUT(EndPoints.deleteCartApi)
  Future<GetCartResponseDto> updateCountInCart(
      @Path('productId') String productId,
      @Header('token') String token,
      @Body() CountRequestDto countRequest);


  @POST(EndPoints.wishlistApi)
  Future<AddWishlistResponseDto> addToFav(
      @Body() AddWishlistRequestDto addWishlist,
      @Header('token') String token);


  @GET(EndPoints.wishlistApi)
  Future<GetWishlistResponseDto> getFavProduct(@Header('token') String token);


  @DELETE(EndPoints.deleteWishlistApi)
  Future<DeleteWishlistResponseDto> deleteItemInWishlist(
      @Path('productId') String productId,
      @Header('token') String token);
}
