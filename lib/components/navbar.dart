import 'package:flutter/material.dart';
import 'package:new_app/config/responsive.dart';
import 'package:new_app/model/product.dart';

class Navbar extends AppBar {
  Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();

  static Wrap leftSide(BuildContext context) => _NavbarState.leftSide(context);
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text('Shopi'),
      actions: <Widget>[
        if(Responsive.isDesktop(context)) leftSide(context),
        rightSide(context),
      ],
    );
  }

  static Wrap leftSide(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: <Widget>[
        navItem(context, 'All', ''),
        navItem(context, 'Men\'s','men'),
        navItem(context, 'Women\'s','women'),
        navItem(context, 'Electronics','electronics'),
        navItem(context, 'Jewelery','jewelery'),
      ],
    );
  }

  static Widget navItem(BuildContext context, String text, String category){
    return TextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/$category'),
      child: Text(text),
    );
  }

  Row rightSide(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        cartButton(),
        // cartButton(),
      ],
    );
  }

    Widget cartButton() {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            final RenderBox button = context.findRenderObject() as RenderBox;
            final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;
            final Offset offset =
                button.localToGlobal(Offset.zero, ancestor: overlay);
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                offset.dx,
                offset.dy + button.size.height,
                overlay.size.width - offset.dx - button.size.width,
                overlay.size.height - offset.dy - button.size.height,
              ),
              items: Cart().items.map((product) {
                return PopupMenuItem(
                  value: product,
                  child: ListTile(
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        Cart().removeProduct(product);
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
        if (Cart().items.isNotEmpty)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child: Text(
                '${Cart().items.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
