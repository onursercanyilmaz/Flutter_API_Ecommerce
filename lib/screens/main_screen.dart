import 'package:ecommerceosy/tabs/categories_tab.dart';
import 'package:ecommerceosy/tabs/products_tab.dart';
import 'package:ecommerceosy/tabs/cart_tab.dart';
import 'package:ecommerceosy/tabs/search_tab.dart';
import 'package:ecommerceosy/tabs/profile_tab.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xff1D2F75),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.category_rounded)),
                Tab(icon: Icon(Icons.view_module_rounded)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.person_rounded)),
                Tab(icon: Icon(Icons.shopping_cart)),
              ],
            ),
            title: const Center(
              child: Text(
                'J-Commerce',
                style: TextStyle(
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              CategoriesTab(),
              ProductsTab(),
              SearchTab(),
              CartTab(),
              ProfileTab(),
            ],
          ),
        ),
      ),
    );
  }
}
