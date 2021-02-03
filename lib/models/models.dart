class Promo {
  final String image, date, discount, category;

  Promo({
    this.image,
    this.date,
    this.discount,
    this.category,
  });
}

class Product {
  final String image, name, size, price;

  Product({
    this.image,
    this.name,
    this.size,
    this.price,
  });
}

class Category {
  final String name, count, image;

  Category({
    this.name,
    this.count,
    this.image,
  });
}
