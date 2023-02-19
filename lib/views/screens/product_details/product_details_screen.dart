import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/product_details/product_details_cubit.dart';
import 'package:grocery_app/views/custom_widgets/loading_indicator.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/constant/my_colors.dart';
import 'package:grocery_app/views/custom_widgets/search_box.dart';
import 'package:grocery_app/views/screens/product_details/components/image_slider.dart';
import 'package:grocery_app/views/screens/product_details/components/text_with_title.dart';
import 'package:grocery_app/views/screens/product_details/components/text_with_title_row.dart';
import 'package:grocery_app/views/custom_widgets/rounded_container.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.slugId});
  final String slugId;
  @override
  Widget build(BuildContext context) {
    const productCubit = BlocProvider.of<ProductDetailsCubit>;
    productCubit(context).loadProductDetails(slugId);
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: MyColors.background,
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const LoadingIndicator();
          }
          if (state is ProductDetailsLoaded) {
            return ProductDetails(product: state.product);
          }
          return const LoadingIndicator();
        }),
      )),
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
          SearchBox(
            onSubmitted: (String slug) {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ImageSlider(images: product.images),
                    const SizedBox(
                      height: 20,
                    ),
                    _title(),
                    const SizedBox(
                      height: 20,
                    ),
                    _subTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    _chargeSection(),
                    const SizedBox(
                      height: 20,
                    ),
                    _details()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      product.productName,
      style: const TextStyle(
          color: MyColors.deep, fontSize: 24, fontWeight: FontWeight.w600),
    );
  }

  Widget _subTitle() {
    return Row(
      children: [
        TextWithTitle(
          title: "ব্রান্ডঃ ",
          value: product.brand.name,
        ),
        const SizedBox(
          width: 10,
        ),
        product.distributors.isNotEmpty
            ? Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: MyColors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                  TextWithTitle(
                    title: "ডিস্ট্রিবিউটরঃ ",
                    value: product.distributors.first,
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }

  Widget _chargeSection() {
    return RoundedContainer(
        radius: 15,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("ক্রয়মূল্যঃ",
                            style: TextStyle(
                                color: MyColors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        Text(
                          "৳ ${product.charge.currentCharge}",
                          style: const TextStyle(
                              color: MyColors.pink,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    TextWithTitleRow(
                      title: "বিক্রয়মূল্যঃ",
                      value: "৳ ${product.charge.sellingPrice}",
                    )
                  ],
                ),
              ),
              const DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: MyColors.grey,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapRadius: 0.0,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWithTitleRow(
                    title: "লাভঃ",
                    value: "৳ ${product.charge.profit}",
                  )),
            ],
          ),
        ));
  }

  Widget _details() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "বিস্তারিত",
            style: TextStyle(
                color: MyColors.lowDeep,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Html(
              data: product.description,
              style: {
                "html": Style(
                  color: MyColors.deepGrey,
                  fontSize: const FontSize(16),
                  fontWeight: FontWeight.w400,
                ),
              },
            ),
          )
        ],
      ),
    );
  }
}
