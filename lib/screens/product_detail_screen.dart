import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {

  final Product product;
  final Function(Product) onAddToCart;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(product.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

       SizedBox(
       height: 250, // change this value to control image size
       child: Image.network(
       product.image,
       fit: BoxFit.contain,
       ),
       ),

            const SizedBox(height: 20),

            Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              product.description,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 220, // makes button wider
              child: ElevatedButton(

                style: ButtonStyle(

                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),

                  backgroundColor:
                      MaterialStateProperty.resolveWith((states){

                    if(states.contains(MaterialState.hovered)){
                      return Colors.yellow.shade700;
                    }

                    return const Color.fromARGB(255, 253, 234, 63);

                  }),

                ),

                onPressed: (){
                  onAddToCart(product);
                  Navigator.pop(context);
                },

                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

              ),
            )

          ],
        ),
      ),
    );
  }
}