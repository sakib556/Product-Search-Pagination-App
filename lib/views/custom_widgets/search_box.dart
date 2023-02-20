import 'package:flutter/material.dart';
import 'package:grocery_app/constant/my_colors.dart';
import 'package:grocery_app/views/custom_widgets/rounded_container.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, required this.onSubmitted});
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      radius: 15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: MyColors.midDeep),
            suffixIcon: Icon(Icons.search),
            hintText: 'কাঙ্ক্ষিত পণ্যটি খুঁজুন',
          ),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
