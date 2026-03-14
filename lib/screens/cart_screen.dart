import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartScreen extends StatefulWidget {

  final List<CartItem> cart;

  const CartScreen({
    super.key,
    required this.cart,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double get subtotal {

    double total = 0;

    for (var item in widget.cart) {
      total += item.product.price * item.quantity;
    }

    return total;
  }

  void increaseQty(int index){
    setState(() {
      widget.cart[index].quantity++;
    });
  }

  void decreaseQty(int index){

    setState(() {

      if(widget.cart[index].quantity > 1){
        widget.cart[index].quantity--;
      }

    });
  }

  void removeItem(int index){

    setState(() {
      widget.cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Your Cart"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Expanded(
              child: ListView.builder(

                itemCount: widget.cart.length,

                itemBuilder: (context,index){

                  final item = widget.cart[index];

                  return Card(

                    color: Colors.yellow.shade100,

                    margin: const EdgeInsets.symmetric(
                      horizontal:10,
                      vertical:8
                    ),

                    child: ListTile(

                      leading: Image.network(
                        item.product.image,
                        width:40
                      ),

                      title: Text(item.product.title),

                      subtitle: Text(
                        "\$${item.product.price}"
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decreaseQty(index),
                          ),

                          Text(item.quantity.toString()),

                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increaseQty(index),
                          ),

                          MouseRegion(
                            cursor: SystemMouseCursors.click,

                            child: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red
                              ),

                              onPressed: () =>
                                  removeItem(index),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height:10),

            Text(
              "Subtotal: \$${subtotal.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold
              ),
            ),

            const SizedBox(height:10),

            ElevatedButton(
              onPressed: (){},
              child: const Text("Checkout"),
            )

          ],
        ),
      ),
    );
  }
}