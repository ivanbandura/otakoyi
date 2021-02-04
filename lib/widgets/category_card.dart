import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name, count, image;

  const CategoryCard({Key key, this.name, this.count, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Column(
        children: [
          SizedBox(height: 30.0),
          Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: 14.0),
              textAlign: TextAlign.center),
          SizedBox(height: 7.0),
          Text(
            '$count Products',
            style: TextStyle(color: Colors.grey, fontSize: 11.0),
          ),
          Spacer(),
          Image.asset(image, width: 90.0, height: 90.0)
        ],
      ),
    );
  }
}
