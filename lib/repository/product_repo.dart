import 'dart:convert';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_details.dart';
import 'package:http/http.dart';

class ProductRepo {
  final int limit = 10;
  final baseUrl = "https://panel.supplyline.network/api";

  Future<List<Product>> fetchProducts(int offset, String slug) async {
    try {
      final response = await get(
          Uri.parse(
              "$baseUrl/product/search-suggestions?limit=$limit&offset=$offset&search=$slug"),
          headers: {'Content-Type': 'application/json'});
      var map = jsonDecode(utf8.decode(response.bodyBytes));
      return ProductResponse.fromMap(map).data.products.products;
    } catch (err) {
      print("error is : $err");
      return [];
    }
  }

  Future<Product> productDetails(String slugId) async {
    final response = await get(Uri.parse("$baseUrl/product-details/$slugId/"),
        headers: {'Content-Type': 'application/json'});
    var map = jsonDecode(utf8.decode(response.bodyBytes));
      print("map is : $map");

    return ProductDetailsResponse.fromMap(map).product;
  }
}
