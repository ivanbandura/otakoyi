import 'package:flutter/material.dart';
import 'package:otakoyi/models/models.dart';
import 'package:otakoyi/widgets/product_card.dart';

class ProductsList extends StatelessWidget {
  final Color fontColor;
  final List<Product> products;

  ProductsList({Key key, this.products, this.fontColor}) : super(key: key);

  final PageController _pageController =
      new PageController(viewportFraction: 1, initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _pageController,
      padding: EdgeInsets.only(left: 17.0, right: 5.0),
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ProductCard(
          image: products[index].image,
          name: products[index].name,
          size: products[index].size,
          price: products[index].price,
          fontColor: fontColor,
        );
      },
    );
  }
}
