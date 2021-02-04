import 'package:flutter/material.dart';
import 'package:otakoyi/models/models.dart';
import 'package:otakoyi/widgets/category_card.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;

  const CategoriesList({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.94),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            name: categories[index].name,
            count: categories[index].count,
            image: categories[index].image,
          );
        },
      ),
    );
  }
}
