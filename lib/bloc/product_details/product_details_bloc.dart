import 'package:bloc/bloc.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/repository/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this.repo) : super(ProductDetailsInitial()) {
    on<LoadProductDetailsEvent>((event, emit) async{
      emit(ProductDetailsLoading());
      await repo.productDetails(event.slugId).then((product) {
        emit(ProductDetailsLoaded(product));
      });
    });
  }
  final ProductRepo repo;
}
