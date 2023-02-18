// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/repository/product_repo.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.repo) : super(ProductDetailsInitial());
  final ProductRepo repo;
  void loadProductDetails(String slugId) {
    emit(ProductDetailsLoading());
    repo.productDetails(slugId).then((product) {
      emit(ProductDetailsLoaded(product));
    });
  }
}
