part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductLoading extends ProductState {
  final List<Product> oldProducts;
  final bool isFirstFetch;

  ProductLoading(this.oldProducts, {this.isFirstFetch = false});
}
