import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/product_details/product_details_cubit.dart';
import 'package:grocery_app/views/custom_widgets/loading_indicator.dart';
import 'package:grocery_app/views/custom_widgets/search_box.dart';
import 'package:grocery_app/model/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.slugId});
  final String slugId;
  @override
  Widget build(BuildContext context) {
    const productCubit = BlocProvider.of<ProductDetailsCubit>;
    productCubit(context).loadProductDetails(slugId);
    return Scaffold(
      body: SafeArea(child:
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const LoadingIndicator();
        }
        if (state is ProductDetailsLoaded) {
          return ProductDetails(product: state.product);
        }
        return const LoadingIndicator();
      })),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("slugId ${product.slug}"),
          Text("Slug ${product.brand.name}"),
          Text("Name ${product.productName}"),
          Text("Sell price ${product.charge.sellingPrice}"),
    
        ],
      ),
    );
  }
}
