import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      child: GestureDetector(
        onTap: onTap,

        child: Card(
          color: Colors.lightBlue.shade50,
          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),

          child: Column(
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),

                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8),

                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height:6),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal:44,
                  vertical:10
                ),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 230, 77),
                  borderRadius: BorderRadius.circular(50)
                ),

                child: Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              const SizedBox(height:10)

            ],
          ),
        ),
      ),
    );
  }
}