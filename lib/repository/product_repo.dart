import 'package:grocery_app/model/product.dart';
import 'package:http/http.dart';

class ProductRepo {
  static const FETCH_LIMIT = 10;
  final baseUrl =
      "https://panel.supplyline.network/api/product/search-suggestions";

  Future<List<Product>> fetchAllProducts() async {
    try {
      final response = await get(Uri.parse(baseUrl));
      return productResponseFromMap(response.body).data.products.results;
    } catch (err) {
      return [];
    }
  }

  Future<List<Product>> fetchProducts(int offset, String slug) async {
    try {
      final response = await get(
          Uri.parse("$baseUrl?limit=$FETCH_LIMIT&offset=$offset&search=$slug"));
      //final response = await get(Uri.parse(baseUrl + "?limit=1&offset=10&search=rice"));
      //final response = await get(Uri.parse(baseUrl + "?_limit=$FETCH_LIMIT&_page=$page"));
      return productResponseFromMap(response.body).data.products.results;
    } catch (err) {
      return [];
    }
  }
}
