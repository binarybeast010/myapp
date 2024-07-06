import 'package:flutter/material.dart';

// Define a class for CartItem
class CartItem {
  final String name;
  final String imageUrl;

  CartItem({required this.name, required this.imageUrl});
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Example list of items in cart with images
  List<CartItem> items = [
    CartItem(
      name: 'Item 1',
      imageUrl:'https://c8.alamy.com/comp/2AKGT2Y/electronics-and-devices-promotional-sale-banner-with-full-shopping-cart-technology-and-online-shopping-concept-2AKGT2Y.jpg',
    ),
    CartItem(
      name: 'Item 2',
      imageUrl: 'https://i.pinimg.com/736x/f0/f9/e4/f0f9e45724771f16745ad3f6f640d3ce.jpg',
    ),
    CartItem(
      name: 'Item 3',
      imageUrl: 'https://c8.alamy.com/comp/PR0M5B/black-friday-promotional-sale-shopping-banner-with-products-and-discount-electronics-computers-and-touch-screen-devices-PR0M5B.jpg',
    ),
    CartItem(
      name: 'Item 4',
      imageUrl: 'https://img.freepik.com/free-vector/flat-black-friday-twitter-cover-template_23-2149103019.jpg',
    ),
  ];

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(items[index].imageUrl),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeItem(index),
            ),
          );
        },
      ),
    );
  }
}
