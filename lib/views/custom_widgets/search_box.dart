import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
   const SearchBox({super.key, required this.searchController,required this.onSubmitted});
  final TextEditingController searchController;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
