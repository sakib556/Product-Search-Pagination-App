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
  String slug = "";
  void loadProducts() {
    if (state is ProductLoading) return;

    final currentState = state;
    var oldProducts = <Result>[];

    if (currentState is ProductLoaded) {
      offset == 10 ? [] : oldProducts = currentState.products;
      //oldProducts = currentState.products;
    }

    emit(ProductLoading(oldProducts, isFirstFetch: offset == 10));

    repo.fetchProducts(offset, slug).then((newProducts) {
      offset = offset + 10;
      final products = (state as ProductLoading).oldProducts;
      products.addAll(newProducts);
      emit(ProductLoaded(products));
    });
  }
}
