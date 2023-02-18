import 'package:grocery_app/model/product.dart';

class ProductDetailsResponse {
    ProductDetailsResponse({
        required this.status,
        required this.statusCode,
        required this.product,
        required this.error,
    });

    String status;
    int statusCode;
    Product product;
    String error;

    factory ProductDetailsResponse.fromMap(Map<String, dynamic> json) => ProductDetailsResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        product: Product.fromMap(json["data"]),
        error: json["error"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "statusCode": statusCode,
        "data": product.toMap(),
        "error": error,
    };
}

