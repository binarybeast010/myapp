import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/product_model.dart';
import '../widgets/product_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://c8.alamy.com/comp/2AKGT2Y/electronics-and-devices-promotional-sale-banner-with-full-shopping-cart-technology-and-online-shopping-concept-2AKGT2Y.jpg', // Placeholder URL 1
    'https://i.pinimg.com/736x/f0/f9/e4/f0f9e45724771f16745ad3f6f640d3ce.jpg', // Placeholder URL 2
    'https://img.freepik.com/free-vector/flat-black-friday-twitter-cover-template_23-2149103019.jpg', // Placeholder URL 3
  ];

  final List<Product> categoryProducts = [
    Product(
      id: 'p1',
      title: 'AC',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBe_iowU-DPEOPs6v58DiSY7dkzRT8BLQKog&s',
      price: 14.99,
    ),
    Product(
      id: 'p2',
      title: 'phone',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvLeovcN03LjQG3TrGFDaO_LFKM2D33W0tmw&s',
      price: 19.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Text(
            'Offers of the Month',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Text(
            'Recent Searches',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(10.0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryProducts.length,
          itemBuilder: (ctx, i) => ProductItem(
            categoryProducts[i].id,
            categoryProducts[i].title,
            categoryProducts[i].imageUrl,
            categoryProducts[i].price,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ],
    );
  }
}
