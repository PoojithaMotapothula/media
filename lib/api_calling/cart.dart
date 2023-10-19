import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/api_calling/cart_providers.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.white,
      ),
      body: Consumer<CartNotifier>(
        builder: (context, cartNotifier, child) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartNotifier.productResponse?.products?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.surfaceVariant,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      "${cartNotifier.productResponse?.products?[index]?.images?[0] ?? ''}",
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "${cartNotifier.productResponse?.products?[index]?.title ?? ''}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Center(child: Text('price: ${cartNotifier.productResponse?.products?[index]?.price ?? ''}')),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
