import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Own packages
import 'package:animaludos/components/horizontal_listview.dart';
import 'package:animaludos/components/products.dart';
import 'package:animaludos/components/drawer.dart';
import 'package:animaludos/components/carousel.dart';
import 'package:animaludos/pages/cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange,
        title: Center(child: Image.asset('assets/logo.png', fit: BoxFit.contain, height: 45)),
        actions: [
          IconButton(
            //SEARCH BUTTON
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            //CART BUTTON
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
            },
            icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
          ),
        ],
      ),
      drawer: DrawerAnimaludos(),
      body: Column(
        children: [
          //CarouselAnimaludos(),

          //CATEGORIAS-----------------------------------------
          // Padding(
          //   padding: EdgeInsets.all(9.0),
          //   child: Text('Categorías',
          //       style: TextStyle(fontWeight: FontWeight.bold)),
          // ),

          //Horizontal listview
          HorizontalList(),

          //RECENT PRODUCTS--------------------------------------
          // Padding(
          //   padding: EdgeInsets.all(9.0),
          //   child: Text('Productos recientes',
          //       style: TextStyle(fontWeight: FontWeight.bold)),
          // ),

          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
