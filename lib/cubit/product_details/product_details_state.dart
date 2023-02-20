// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product product;

  ProductDetailsLoaded(this.product);
 
}

class ProductDetailsLoading extends ProductDetailsState {}
