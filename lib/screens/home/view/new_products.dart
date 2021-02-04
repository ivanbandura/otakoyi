import 'package:flutter/material.dart';
import 'package:otakoyi/models/models.dart';
import 'package:otakoyi/screens/home/view/products_list.dart';

class NewProducts extends StatelessWidget {
  final Color backgroundColor, fontColor;
  final String count, sex;
  final List<Product> products;

  NewProducts(
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
            child: _NewProductsInfo(
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
            child: ProductsList(
              products: products,
              fontColor: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewProductsInfo extends StatelessWidget {
  final Color backgroundColor, fontColor;
  final String count, sex;

  const _NewProductsInfo(
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
            fontSize: 11.0,
            letterSpacing: 1.0),
      ),
      onTap: () {},
    );
  }
}
