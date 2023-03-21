part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {}

class AddToCartEvent extends ProductEvent {
  final Product product ;

  AddToCartEvent(this.product);

}
class RemoveFromCartEvent extends ProductEvent {
  final Product product ;

  RemoveFromCartEvent(this.product);

}