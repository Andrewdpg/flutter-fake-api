import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_app/model/product.dart';
import 'package:new_app/pages/home_page.dart';

class ApiConnection {
  // We will connect to https://fakestoreapi.com/products only to get products
  static const String _baseUrl = 'https://fakestoreapi.com';
  static const String _products = '/products';

  static List<Product> _cacheProducts = [];

  static Future<List<Product>> getProducts(String category) async {
    if (_cacheProducts.isEmpty) {
      final response = await http.get(Uri.parse('$_baseUrl$_products'));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        _cacheProducts =
            body.map((dynamic item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    }

    HomePage.products = _cacheProducts
        .where((product) => product.category.toLowerCase().contains(category))
        .toList();

    return HomePage.products;
  }
}
