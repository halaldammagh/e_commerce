class EndPoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';
  static const String loginApi = 'auth/signin';
  static const String registerApi = 'auth/signup';
  static const String categoriesApi = 'categories';
  static const String brandsApi = 'brands';
  static const String productsApi = 'products';
  static const String addCartApi = 'cart';
  static const String deleteCartApi = 'cart/{productId}';
  static const String deleteWishlistApi = 'wishlist/{productId}';
  static const String putCartApi = 'cart/{productId}';
  static const String wishlistApi = 'wishlist';
  static const String verifyApi = 'auth/verifyToken';
}