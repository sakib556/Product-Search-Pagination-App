import 'package:bloc/bloc.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/repository/product_repo.dart';
import 'package:meta/meta.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.repo) : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async{
      if (state is ProductLoading) return;
      final currentState = state;
      var oldProducts = <Product>[];
      if (currentState is ProductLoaded) {
        offset == 10 ? [] : oldProducts = currentState.products;
        //oldProducts = currentState.products;
      }
      emit(ProductLoading(oldProducts, isFirstFetch: offset == 10));
      await repo.fetchProducts(offset, slug).then((newProducts) {
        offset = offset + 10;
        final products = (state as ProductLoading).oldProducts;
        products.addAll(newProducts);
        emit(ProductLoaded(products));
      });
    });
    on<AddToCartEvent>((event, emit) {
      final Product product = event.product;
      final List<Product> productList = (state as ProductLoaded).products;
      final productIndex = productList.indexWhere(
        (item) => item.id == product.id,
      );
      final updatedProduct = product.copyWith(cartCount: product.cartCount + 1);
      productList[productIndex] = updatedProduct;
      emit(ProductLoaded(productList));
    });
    on<RemoveFromCartEvent>((event, emit) {
      final Product product = event.product;
      final List<Product> productList = (state as ProductLoaded).products;
      final productIndex = productList.indexWhere(
        (item) => item.id == product.id,
      );
      final updatedProduct = product.copyWith(cartCount: product.cartCount - 1);
      productList[productIndex] = updatedProduct;
      emit(ProductLoaded(productList));
    });
  }
  int offset = 10;
  final ProductRepo repo;
  String slug = "";
}
