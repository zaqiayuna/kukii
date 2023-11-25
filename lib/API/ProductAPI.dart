import 'package:kuki/Model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductAPI {
  Future<Product> fetchProductList(category, name) async {
    print('Hitted');
    print("category ${category} name ${name}");
    String param = '';
    if (category == 'type') {
      param = 'product_type';
    } else if (category == 'brand') {
      param = 'brand';
    }
    final response = await http.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?${param}=${name}'));

    if (response.statusCode == 200) {
      print('Hit Finished');
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }
}
