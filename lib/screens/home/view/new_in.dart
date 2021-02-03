import 'package:flutter/material.dart';
import 'package:otakoyi/models/models.dart';
import 'package:otakoyi/widgets/product_card.dart';

class NewIn extends StatelessWidget {
  final Color backgroundColor, fontColor;
  final String count, sex;
  final List<Product> products;

  NewIn(
      {Key key,
      this.backgroundColor,
      this.fontColor,
      this.count,
      this.sex,
      this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: backgroundColor == Colors.black ? height * 0.54 : height * 0.49,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: backgroundColor == Colors.black,
            child: SizedBox(height: 40),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: _NewInInfo(
              count: count,
              sex: sex,
              fontColor: fontColor,
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
            child: _SeeMoreButton(),
          ),
          Expanded(
            child: _ProductsList(
              products: products,
              fontColor: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewInInfo extends StatelessWidget {
  final Color backgroundColor, fontColor;
  final String count, sex;

  const _NewInInfo(
      {Key key, this.backgroundColor, this.fontColor, this.count, this.sex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$count PRODUCTS',
            style: TextStyle(
                color: Colors.grey, letterSpacing: 1.0, fontSize: 14.0)),
        SizedBox(height: 6.0),
        Row(
          children: [
            Text(
              sex,
              style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: 20.0),
            ),
            Text(
              ' NEW IN',
              style: TextStyle(
                  color: Colors.grey, letterSpacing: 1.0, fontSize: 20.0),
            )
          ],
        )
      ],
    );
  }
}

class _SeeMoreButton extends StatelessWidget {
  const _SeeMoreButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        'SEE MORE',
        style: TextStyle(
            color: Color.fromRGBO(199, 175, 103, 1),
            fontSize: 12.0,
            letterSpacing: 1.0),
      ),
      onTap: () {},
    );
  }
}

class _ProductsList extends StatelessWidget {
  final Color fontColor;
  final List<Product> products;

  _ProductsList({Key key, this.products, this.fontColor}) : super(key: key);

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
