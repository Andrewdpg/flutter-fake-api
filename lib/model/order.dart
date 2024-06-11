import 'package:new_app/model/Product.dart';

class Order {
  final int id;
  final List<Product> products;

  Order({
    required this.id,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> products =
        productList.map((i) => Product.fromJson(i)).toList();

    return Order(
      id: json['id'],
      products: products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
