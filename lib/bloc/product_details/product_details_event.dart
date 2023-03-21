part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class LoadProductDetailsEvent extends ProductDetailsEvent {
  final String slugId;

  LoadProductDetailsEvent(this.slugId);
}
