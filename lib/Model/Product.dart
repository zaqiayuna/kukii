import 'dart:math';

class Product {
  late List<ProductSummary> productSummary;

  Product.fromJson(List<dynamic> json) {
    int maxData = json.length >= 7 ? 7 : json.length;
    List<int> indexed = [];
    productSummary = new List<ProductSummary>.empty();
    for (var i = 0; i < maxData; i++) {
      int random = Random().nextInt(json.length - 1);
      while (indexed.contains(random)) {
        random = Random().nextInt(maxData - 1);
      }
      // indexed.add(random);
      // print(indexed);
      productSummary = [
        ...productSummary,
        new ProductSummary.fromJson(json[random])
      ];
    }
    // json.forEach((item){
    //   productSummary.add(new ProductSummary.fromJson(item));
    // });
  }
}

class ProductSummary {
  late String name;
  late String brand;
  late String image;
  late String category;
  late String priceSign;
  late String price;
  late String description;
  late double rating;

  ProductSummary(
      {required this.name,
      required this.brand,
      required this.image,
      required this.category,
      required this.priceSign,
      required this.price,
      required this.description,
      required this.rating});

  ProductSummary.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '-';
    brand = json['brand'] ?? '-';
    image = json['image_link'] ?? '-';
    category = json['category'] ?? '-';
    priceSign = json['price_sign'] ?? "\$";
    price = json['price'] ?? '-';
    description = json['description'] ?? '-';
    rating = json['rating'] ?? 0.0;
  }
}
