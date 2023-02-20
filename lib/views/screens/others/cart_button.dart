import 'package:flutter/material.dart';
import 'package:grocery_app/cubit/product/product_cubit.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/views/custom_widgets/plus_button.dart';
import 'package:grocery_app/views/custom_widgets/minus_button.dart';
import 'package:grocery_app/constant/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: MyColors.freshPink3,
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // First child widget
            MinusButton(
              onTap: () {
                if (product.cartCount != 0) {
                  context.read<ProductCubit>().removeFromCart(product);
                }
              },
              height: 28,
            ),
            // Second child widget
            Text(
              "${product.cartCount} পিস",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: MyColors.red),
            ),
            PlusButton(
              onTap: () {
                if (product.cartCount != product.stock) {
                  print("object1");
                  context.read<ProductCubit>().addToCart(product);
                  print("object1");
                }
              },
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}
