import 'package:flutter/material.dart';
import 'package:otakoyi/core/app_icons.dart';

class ProductCard extends StatelessWidget {
  final String image, name, size, price;
  final Color fontColor;

  const ProductCard(
      {Key key, this.image, this.name, this.size, this.price, this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductImage(image: image),
        _ProductInfo(
          name: name,
          size: size,
          price: price,
          fontColor: fontColor,
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String image;

  const _ProductImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.227,
      width: width * 0.34,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: width * 0.32,
              height: height * 0.2,
            ),
          ),
          Positioned(top: -2.0, right: 5.0, child: _LikeButton()),
          Positioned(bottom: 0.0, left: -14.0, child: _BuyButton())
        ],
      ),
    );
  }
}

class _LikeButton extends StatefulWidget {
  const _LikeButton({Key key}) : super(key: key);

  @override
  __LikeButtonState createState() => __LikeButtonState();
}

class __LikeButtonState extends State<_LikeButton> {
  bool presssedFovorite = false;

  _handleLikeSate() => setState(() {
        presssedFovorite = !presssedFovorite;
      });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Icon(
        AppIcons.product_like,
        size: 14,
        color: presssedFovorite ? Colors.red : Colors.grey,
      ),
      onPressed: () => _handleLikeSate(),
    );
  }
}

// ignore: must_be_immutable
class _BuyButton extends StatefulWidget {
  _BuyButton({Key key}) : super(key: key);

  @override
  __BuyButtonState createState() => __BuyButtonState();
}

class __BuyButtonState extends State<_BuyButton> {
  bool presssedBuy = false;

  _handleBuyState() => setState(() {
        presssedBuy = !presssedBuy;
      });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 1.0,
      fillColor: Colors.white,
      child: Icon(
        AppIcons.product_cart,
        size: 18.0,
        color: presssedBuy ? Color.fromRGBO(199, 175, 103, 1) : Colors.black,
      ),
      padding: EdgeInsets.all(8.0),
      shape: CircleBorder(),
      onPressed: () => _handleBuyState(),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final String name, size, price;
  final Color fontColor;

  const _ProductInfo(
      {Key key, this.name, this.size, this.price, this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.3,
          child: Text(
            name,
            style: TextStyle(color: fontColor),
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          size,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 9.0),
        Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
