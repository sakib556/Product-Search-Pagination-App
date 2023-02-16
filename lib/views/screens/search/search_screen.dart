// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/product/product_cubit.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/views/custom_widgets/search_box.dart';
import 'package:grocery_app/views/screens/search/components/product_card.dart';
import 'package:grocery_app/views/custom_widgets/loading_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _scrollController = ScrollController();

  void setupScrollController(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          print("load pruduct 1\n");
          BlocProvider.of<ProductCubit>(context).loadProducts();
          print("load pruduct 2\n");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const productCubit = BlocProvider.of<ProductCubit>;
    setupScrollController(context);
    productCubit(context).loadProducts();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchBox(
              searchController: _searchController,
              onSubmitted: (String slug) {
                productCubit(context).offset = 10;
                productCubit(context).slug = slug;
                productCubit(context).loadProducts();
              },
            ),
            ProductList(
              scrollController: _scrollController,
            )
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoading && state.isFirstFetch) {
        return const LoadingIndicator();
      }

      List<Result> products = [];
      bool isLoading = false;

      if (state is ProductLoading) {
        products = state.oldProducts;
        isLoading = true;
      } else if (state is ProductLoaded) {
        products = state.products;
      }
      return Expanded(
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: (270 / 400),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: products.length + (isLoading ? 1 : 0),
          itemBuilder: (BuildContext ctx, index) {
            print("length :  ${products.length}\n");
            print("index :  ${index}\n");
            if (index < products.length) {
              return ProductCard(
                product: products[index],
              );
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });

              return const LoadingIndicator();
            }
          },
        ),
      );
    });
  }
}
