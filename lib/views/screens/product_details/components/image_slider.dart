import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/views/custom_widgets/rounded_container.dart';

class ImageSlider extends StatelessWidget {
  final List<ProductImage> images;

  const ImageSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 308.0,
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: images.map((image) {
        return RoundedContainer(
          radius: 20,
          child: Center(
            child: SizedBox(
              height: 250,
              child: CachedNetworkImage(
                imageUrl: image.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
