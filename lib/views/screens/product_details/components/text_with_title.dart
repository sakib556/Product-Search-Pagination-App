import 'package:flutter/material.dart';
import 'package:grocery_app/constant/my_colors.dart';

class TextWithTitle extends StatelessWidget {
  const TextWithTitle({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
          TextSpan(
            text:  title,
            style: const TextStyle(color: MyColors.deepGrey),
            children: [
              TextSpan(
                text: value,
                style: const TextStyle(color: MyColors.deep),
              ),
            ],
          ),
        );
  }
}