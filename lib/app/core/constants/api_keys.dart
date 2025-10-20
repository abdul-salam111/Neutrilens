class ApiKeys {
  static final baseUrl = "https://a20a7442cf7c.ngrok-free.app";
  static final getGoalsAndDietUrl = "$baseUrl/goals-diet-list";
  static final registerUserUrl = "$baseUrl/auth/register";
  static final loginUserUrl = "$baseUrl/auth/login";
  static final getUserUrl = "$baseUrl/user/profile";
  static final getSuggestedProductsUrl = "$baseUrl/scan/analysis?barcode=";
  static final uploadScannedProductUrl = "$baseUrl/scan/";
  static final openfoodBaseUrl = "https://world.openfoodfacts.org";
  static final getTrendsUrl = "$baseUrl/scan/stats?from_date=";
  static final openapiProductFields =
      "fields=product_name,brands,nutriment_nutrients,nutriscore_score,nutriscore_grade,image_front_small_url,quantity,code,categories";
}
