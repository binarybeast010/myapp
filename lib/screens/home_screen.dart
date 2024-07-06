import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'laptop',
      imageUrl: 'https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/PDP-Highlight-Consumer-Laptop-Go-3-Platinum-001:VP1-539x440',
      price: 5.99,
    ),
    Product(
      id: 'p2',
      title: 'fridge',
      imageUrl: 'https://images-cdn.ubuy.co.in/65979c2cb910f53d2e6e34ae-3-5cu-ft-compact-refrigerator-mini.jpg',
      price: 9.99,
    ),
    Product(
      id: 'p3',
      title: 'television',
      imageUrl: 'https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1697624774/Croma%20Assets/Entertainment/Television/Images/251190_0_esdvdk.png',
      price: 7.99,
    ),
    Product(
      id: 'p4',
      title: 'headphone',
      imageUrl: 'https://static.toiimg.com/thumb/msid-108706412,width-400,resizemode-4/108706412.jpg',
      price: 4.99,
    ),
    Product(
      id: 'p5',
      title: 'Phone',
      imageUrl: 'https://images.cnbctv18.com/wp-content/uploads/2024/01/untitled-design-87-780x438.jpg',
      price: 6.99,
    ),
    Product(
      id: 'p6',
      title: 'Earbuds',
      imageUrl: 'https://m.media-amazon.com/images/I/614hH1Cot3L._AC_UF1000,1000_QL80_.jpg',
      price: 12.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Text(
            'Available Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: loadedProducts.length,
            itemBuilder: (ctx, i) => ProductItem(
              loadedProducts[i].id,
              loadedProducts[i].title,
              loadedProducts[i].imageUrl,
              loadedProducts[i].price,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}
