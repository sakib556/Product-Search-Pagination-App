// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constant/my_colors.dart';
import 'package:grocery_app/cubit/product/product_cubit.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/views/custom_widgets/plus_button.dart';
import 'package:grocery_app/views/custom_widgets/rounded_container.dart';
import 'package:grocery_app/views/screens/others/cart_button.dart';
import 'package:grocery_app/views/screens/product_details/product_details_screen.dart';
import 'package:grocery_app/views/screens/search/components/small_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 257,
        child: RoundedContainer(
          radius: 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ProductDetailsScreen(
                        slugId: product.slug,
                      )),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 148,
                      width: 148,
                      child: Stack(children: [
                        Center(
                          child: _image(),
                        ),
                        product.stock == 0
                            ? Positioned(
                                top: 1,
                                right: 2,
                                child: _stockOut(),
                              )
                            : const SizedBox()
                      ])),
                  _title(),
                  _chargeSection()
                ],
              ),
            ),
          ),
        ),
      ),
      product.stock != 0
          ? Positioned(
              bottom: 5, right: 0, left: 0, child: _addToCartBtn(context))
          : const SizedBox.shrink()
    ]);
  }

  Widget _image() {
    return SizedBox(
        height: 117,
        width: 87,
        child: CachedNetworkImage(
          imageUrl: product.image,
          fit: BoxFit.contain,
        ));
  }

  Widget _title() {
    return Text(
      product.productName,
      maxLines: 2,
      style: const TextStyle(
          fontSize: 14,
          overflow: TextOverflow.ellipsis,
          color: MyColors.lowDeep,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _stockOut() {
    return const RoundedContainer(
        backgroundColor: MyColors.freshPink,
        radius: 5,
        child: Text(
          " স্টকে নেই ",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: MyColors.red),
        ));
  }

  Widget _addToCartBtn(BuildContext context) {
    return product.cartCount == 0
        ? PlusButton(
            onTap: () {
              print("state id ${product.id}");
              if (product.cartCount != product.stock) {
                //  print("object11");
                context.read<ProductCubit>().addToCart(product);
                //print("object12");
              }
            },
            height: 36,
          )
        : CartButton(
            product: product,
          );
  }

  Widget _chargeSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SmallText(text: "ক্রয়"),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "৳${product.charge.currentCharge}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.pink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text:
                    '৳${product.charge.discountCharge ?? product.charge.currentCharge}',
                style: const TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                  color: MyColors.pink,
                  fontWeight: FontWeight.w500,
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
                const SmallText(text: "বিক্রয়"),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "৳${product.charge.sellingPrice}",
                  style: const TextStyle(
                      fontSize: 12,
                      color: MyColors.deepGrey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                const SmallText(text: "লাভ"),
                const SizedBox(
                  width: 1,
                ),
                RichText(
                  text: TextSpan(
                    text: '৳${product.charge.profit}',
                    style: const TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        color: MyColors.deepGrey,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
