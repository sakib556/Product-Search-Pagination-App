import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
   const SearchBox({super.key,required this.onSubmitted});
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'কাঙ্ক্ষিত পণ্যটি খুঁজুন',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
