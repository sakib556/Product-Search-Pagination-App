import 'package:flutter/material.dart';
import 'package:grocery_app/constant/my_colors.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text});
  final String text ;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
        fontSize: 8,
        color: MyColors.deepGrey,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
