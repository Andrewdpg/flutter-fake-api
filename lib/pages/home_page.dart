import 'package:flutter/material.dart';
import 'package:new_app/components/home_product.dart';
import 'package:new_app/components/navbar.dart';
import 'package:new_app/config/responsive.dart';
import 'package:new_app/data/connection.dart';
import 'package:new_app/model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.category});

  final String category;
  @override
  State<HomePage> createState() => _HomePageState();

  static List<Product> products = [];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scrollbar(
            thumbVisibility: true,
            thickness: 5,
            radius: const Radius.circular(5),
            trackVisibility: true,
            interactive: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (Responsive.isMobile(context)) Navbar.leftSide(context),
                  _buildProductList(),
                ],
              ),
            ),
          )),
    );
  }

  FutureBuilder<List<Product>> _buildProductList() {
    return FutureBuilder(
      future: ApiConnection.getProducts(widget.category),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (HomePage.products.isEmpty && snapshot.hasData) {
          return const Text('No products found');
        }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
          return SingleChildScrollView(
              child: Center(
            child: Wrap(
              children: HomePage.products
                  .map((product) => HomeProduct(product: product))
                  .toList(),
            ),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
