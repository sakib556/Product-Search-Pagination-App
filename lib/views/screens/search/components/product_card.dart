import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:grocery_app/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Result product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 148,
                  width: 148,
                  child: Center(
                    child: SizedBox(
                        height: 117,
                        width: 87,
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        )),
                  )),
              Text(
                product.productName,
                style: const TextStyle(
                    fontSize: 12, overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "ক্রয়",
                        style: TextStyle(fontSize: 8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "৳ ${product.charge.currentCharge}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          '৳ ${product.charge.discountCharge ?? product.charge.currentCharge}',
                      style: const TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.pink,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "বিক্রয়",
                        style: TextStyle(fontSize: 8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "৳ ${product.charge.sellingPrice}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "লাভ",
                        style: TextStyle(fontSize: 8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '৳ ${product.charge.profit}',
                          style: const TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
