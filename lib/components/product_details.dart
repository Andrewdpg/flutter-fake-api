import 'package:flutter/material.dart';
import 'package:new_app/config/responsive.dart';
import 'package:new_app/model/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      interactive: true,
      thickness: 5,
      radius: const Radius.circular(5),
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(product.title,
                    style: Responsive.isMobile(context)
                        ? Theme.of(context).textTheme.headlineMedium
                        : Theme.of(context).textTheme.headlineLarge),
              ),
              Wrap(
                spacing: 50,
                children: [
                  _productImage(context),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3-50,
                    constraints: const BoxConstraints(
                      minWidth: 200,
                      minHeight: 200,
                    ),
                    child: Center(
                      child: Text(product.description, textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product.price}',
                      style: Responsive.isMobile(context)
                          ? Theme.of(context).textTheme.headlineMedium
                          : Theme.of(context).textTheme.headlineLarge),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.height * 0.2,
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 200,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(product.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
