// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/repository/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.repo) : super(ProductInitial());

  int offset = 10;
  final ProductRepo repo;

  void loadPosts() {
    if (state is ProductLoading) return;

    final currentState = state;

    var oldProducts = <Product>[];
    if (currentState is ProductLoaded) {
      oldProducts = currentState.products;
    }

    emit(ProductLoading(oldProducts, isFirstFetch: offset == 10));

    repo.fetchProducts(offset, "rice").then((newProducts) {
      offset = offset + 10;

      final products = (state as ProductLoading).oldProducts;
      products.addAll(newProducts);

      emit(ProductLoaded(products));
    });
  }
}
