import 'package:flutter/material.dart';
import 'package:grocery_app/constant/my_colors.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({super.key, required this.onTap, required this.height});
  final void Function() onTap;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: height,
          width: height,
          decoration: const BoxDecoration(
            color: MyColors.freshPink,
            shape: BoxShape.circle,
          ),
          child: const Center(child: Icon(Icons.remove,color: Colors.white,),)
        ));
  }
}
