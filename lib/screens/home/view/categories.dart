import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'BEST\nCATEGORIES',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 20),
                ),
                _SeeAllButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SeeAllButton extends StatelessWidget {
  const _SeeAllButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        'SEE ALL',
        style: TextStyle(
            letterSpacing: 1.0,
            color: Color.fromRGBO(199, 175, 103, 1),
            fontSize: 11.0),
      ),
      onTap: () {},
    );
  }
}
