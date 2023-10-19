import 'package:flutter/material.dart';
import 'package:task_2/api_calling/cart.dart';
import 'api_calling/tab1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Apicalls(),
    CartScreen(),
    WishlistTab(),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
        ],
      ),
    );
  }
}



class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with content for Tab 1
    return Center(
      child: Text("Tab 1 Content"),
    );
  }
}

class StoresTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with content for Stores tab
    return Center(
      child: Text("Stores Content"),
    );
  }
}

class WishlistTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with content for Wishlist tab
    return Center(
      child: Text("Wishlist Content"),
    );
  }
}
