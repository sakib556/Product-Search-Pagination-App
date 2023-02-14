// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:grocery_app/views/custom_widgets/search_box.dart';
import 'package:grocery_app/views/screens/search/components/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchBox(
              searchController: _searchController,
              onSubmitted: (String slug) {
                //hit the api value with the slug
                //setstate now for test
                setState(() {});
              },
            ),
            ProductList(
              slug: _searchController.text,
            )
          ],
        ),
      ),
    );
  }
}

final List<String> productList = [
  "index1",
  "index2",
  "index3",
  "index4",
  "index5",
  "index6",
  "index6",
  "index6",
  "index6",
];


class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.slug,
  }) : super(key: key);
  final String slug;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (250 / 400),// width/height
        shrinkWrap: true,
        children: productList.map((subTitle) => ProductCard(title: slug, subTitle: subTitle)).toList(),
      ),
    );
  }
}
