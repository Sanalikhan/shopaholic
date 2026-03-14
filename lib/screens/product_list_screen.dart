import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/cart_item.dart';
import '../services/product_service.dart';

import '../widgets/product_card.dart';
import '../widgets/banner_slider.dart';

import 'product_detail_screen.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Product> products = [];
  List<CartItem> cart = [];

  @override
  void initState() {
    super.initState();
    products = ProductService.getProducts();
  }

  void addToCart(Product product) {

    final index =
        cart.indexWhere((item) => item.product.id == product.id);

    setState(() {

      if (index >= 0) {
        cart[index].quantity++;
      } else {
        cart.add(CartItem(product: product));
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
      title: RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
    children: [

      TextSpan(text: "Shop", style: TextStyle(color: const Color.fromARGB(255, 254, 24, 24))),
      TextSpan(text: "a", style: TextStyle(color: Colors.purple)),
      TextSpan(text: "holic", style: TextStyle(color: const Color.fromARGB(255, 27, 187, 195)))
    ],
  ),
),

        actions: [

          IconButton(
            icon: const Icon(Icons.shopping_cart),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(cart: cart),
                ),
              );
            },
          )

        ],
      ),

      body: Column(
        children: [

          const BannerSlider(),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(

              padding: const EdgeInsets.all(10),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),

              itemCount: products.length,

              itemBuilder: (context, index) {

                final product = products[index];

                return ProductCard(
                  product: product,

                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(
                          product: product,
                          onAddToCart: addToCart,
                        ),
                      ),
                    );

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}