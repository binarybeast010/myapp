import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
  final Function removeItem;

  CartItemWidget({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.removeItem,
  });

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Remove Item'),
        content: Text('Do you want to remove this item from the cart?'),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              removeItem(id);
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: GestureDetector(
            onTap: () => _showRemoveDialog(context),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
