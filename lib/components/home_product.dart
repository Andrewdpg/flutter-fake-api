import 'package:flutter/material.dart';
import 'package:new_app/components/product_details.dart';
import 'package:new_app/model/product.dart';

class HomeProduct extends StatefulWidget {
  final Product product;

  const HomeProduct({super.key, required this.product});

  @override
  HomeProductState createState() => HomeProductState();
}

class HomeProductState extends State<HomeProduct> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 150,
        height: 280,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
              Theme.of(context).cardColor.withOpacity(_isHovered ? 0.8 : 1.0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isHovered
              ? [const BoxShadow(color: Colors.black26, blurRadius: 4)]
              : [],
        ),
        child: Column(
          children: <Widget>[
            _addButton(),
            _productImage(),
            _productDetails(),
            _detailsButton()
          ],
        ),
      ),
    );
  }

  Widget _addButton() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Widget _productImage() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.product.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${widget.product.price}',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
            widget.product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _detailsButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            enableDrag: false,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ProductDetails(product: widget.product),
              );
            },
          );
        },
        child: const Text('Details'),
      ),
    );
  }
}
