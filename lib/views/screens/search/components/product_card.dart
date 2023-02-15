import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 148,
                  width: 148,
                  child: Center(
                    child: SizedBox(
                        height: 117,
                        width: 87,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1384/%E0%A6%B8%E0%A6%9C_5.png',
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                  
                        )
                        ),
                  )),
              title.isEmpty ? const SizedBox() : Text(title),
              const Text("মোজাম্মেল সিদ্ধ খুদ- ৫০ কেজি"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("ক্রয়"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("৳ 20.00"),
                    ],
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '৳ 22.00',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.pink,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("ক্রয়"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("৳ 20.00"),
                    ],
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '৳ 22.00',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.pink,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
