import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  ProductItem(this.id, this.title, this.imageUrl, this.price);

  void selectProduct(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Product Details'),
              onTap: () {
                Navigator.of(ctx).pop();
                // Navigate to product details screen
              },
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text('Add to Cart'),
              onTap: () {
                Navigator.of(ctx).pop();
                // Add product to cart
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to cart!'),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () => selectProduct(context),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            // Add product to cart
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Added to cart!'),
            ));
          },
        ),
      ),
    );
  }
}
