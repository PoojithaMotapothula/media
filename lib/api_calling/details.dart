import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/api_calling/cart_providers.dart'  ;
import 'package:task_2/api_calling/tab1.dart' ;


class ProductDetailPage extends StatefulWidget {
  final ProductItem product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 0;
  TextEditingController quantityController = TextEditingController();
  Color _iconColor = Colors.black;
  
  var cartNotifier;

  void addToCartCallback(ProductItem product) {
  cartNotifier.addToCart(ProductItem);
  }
  @override
  void initState() {
    super.initState();
    quantityController.text = quantity.toString();
    cartNotifier = Provider.of<CartNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Product Detail',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Image.network(
                widget.product.images![0],
                height: 350,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.product.title ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Price: ${widget.product.price ?? 0}',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Brand: ${widget.product.brand ?? ''}',
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Category: ${widget.product.category ?? ''}',
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  'Description: ${widget.product.description ?? ''}',
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 500,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.black87, width: 1.0),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                if (quantity < 4) {
                                  setState(() {
                                    quantity++;
                                    quantityController.text =
                                        quantity.toString();
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              width: 10,
                              child: TextFormField(
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  if (quantity > 0) {
                                    setState(() {
                                      quantity = int.tryParse(value) ?? 0;
                                    });
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (quantity >= 1) {
                                  setState(() {
                                    quantity--;
                                    quantityController.text =
                                        quantity.toString();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _iconColor = Colors.red; // Change icon color
                          });
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: _iconColor, // Use the updated color
                        ),
                        label: Text(
                          "Wishlist",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side:
                                BorderSide(color: Colors.black87, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add your logic for the second TextButton here
                        },
                        icon: Icon(Icons.share, color: Colors.black),
                        label: Text("Share",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side:
                                BorderSide(color: Colors.black87, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 88.0),
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            addToCartCallback(widget.product);
                          },
                          child: Text('Add to Cart',
                              style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side:
                                    BorderSide(color: Colors.black87, width: 1.0),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Buy Now',
                              style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side:
                                    BorderSide(color: Colors.black87, width: 1.0),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
