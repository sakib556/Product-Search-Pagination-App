import 'dart:convert';
import 'package:grocery_app/model/product.dart';
import 'package:http/http.dart';

class ProductRepo {
  static const FETCH_LIMIT = 10;
  final baseUrl =
      "https://panel.supplyline.network/api/product/search-suggestions";

  Future<List<Result>> fetchAllProducts() async {
    try {
      final response = await get(Uri.parse(baseUrl));
      var json = jsonDecode(response.body);

      return ProductResponse.fromMap(json).data.products.results;
    } catch (err) {
      return [];
    }
  }

  Future<List<Result>> fetchProducts(int offset, String slug) async {
    try {
      final response = await get(
          Uri.parse("$baseUrl?limit=$FETCH_LIMIT&offset=$offset&search=$slug"),
          headers: {'Content-Type': 'application/json'});
      var map = jsonDecode(utf8.decode(response.bodyBytes));
      return ProductResponse.fromMap(map).data.products.results;
    } catch (err) {
      print("error is : $err");
      return [];
    }
  }
}
