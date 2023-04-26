import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:terence_app/cart_page.dart';
import 'package:terence_app/home/main_food_page.dart';
import 'package:terence_app/profile_page.dart';
import 'package:terence_app/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    MainFoodPage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: _onItemTapped,
        tabs: [
          MoltenTab(
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          MoltenTab(
            icon: Icon(Icons.search),
          ),
          MoltenTab(
            icon: Icon(Icons.shopping_cart),
          ),
          MoltenTab(
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
