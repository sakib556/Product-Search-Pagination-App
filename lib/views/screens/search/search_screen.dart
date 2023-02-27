// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/constant/my_colors.dart';
import 'package:grocery_app/cubit/product/product_cubit.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/views/custom_widgets/search_box.dart';
import 'package:grocery_app/views/screens/product_details/product_details_screen.dart';
import 'package:grocery_app/views/screens/search/components/product_card.dart';
import 'package:grocery_app/views/custom_widgets/loading_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      appBar: AppBar(backgroundColor: MyColors.background,),
      body: SafeArea(
        child: Container(
          color: MyColors.background,
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            children: <Widget>[
              SearchBox(
                onSubmitted: (String slug) {
                  productCubit(context).offset = 10;
                  productCubit(context).slug = slug;
                  productCubit(context).loadProducts();
                },
              ),
              const SizedBox(
                height: 10,
              ),
             
              const SizedBox(
                height: 10,
              ),
              ProductList(
                scrollController: _scrollController,
              )
            ],
          ),
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

      List<Product> products = [];
      bool isLoading = false;

      if (state is ProductLoading) {
        products = state.oldProducts;
        isLoading = true;
      } else if (state is ProductLoaded) {
        products = state.products;
      }
      return Expanded(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: GridView.builder(
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (270 / 300),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 17,
                    mainAxisExtent: 280),
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, index) {
                  if (index < products.length) {
                    return ProductCard(
                      product: products[index],
                    );
                  } else {
                    Timer(const Duration(milliseconds: 30), () {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });

                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            if (isLoading)
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                  child: Center(
                    child: LoadingIndicator(),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
