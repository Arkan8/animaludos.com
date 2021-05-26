import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var productsOnCart = [
    {
      "name": "KOME Pienso para perros adultos con pollo y cordero",
      "picture": "assets/products/pienso.jpg",
      "price": 19.99,
      "size":"12kg",
      "color":"none",
      "quantity":"1"
    },
    {
      "name": "Arnés",
      "picture": "assets/products/arnes.jpg",
      "price": 14.99,
      "size":"M",
      "color":"blue",
      "quantity":"1"
    },
    {
      "name": "Arnés",
      "picture": "assets/products/arnes.jpg",
      "price": 14.99,
      "size":"S",
      "color":"red",
      "quantity":"1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnCart.length,
      itemBuilder: (context, index){
       return SingleCartProduct(
           cartProductName: productsOnCart[index]["name"],
           cartProductPic: productsOnCart[index]["picture"],
           cartProductPrice: productsOnCart[index]["price"],
           cartProductSize: productsOnCart[index]["size"],
           cartProductColor: productsOnCart[index]["color"],
           cartProductQuantity: productsOnCart[index]["quantity"]
       );
      });
  }
}

class SingleCartProduct extends StatelessWidget {

  final cartProductName;
  final cartProductPic;
  final cartProductPrice;
  final cartProductSize;
  final cartProductColor;
  final cartProductQuantity;

  SingleCartProduct({this.cartProductName, this.cartProductPic, this.cartProductPrice, this.cartProductSize, this.cartProductColor, this.cartProductQuantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cartProductPic),
        title: Text(cartProductName),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 5, 5),
              child: Row(
                children: [
                  Expanded(
                      child: Text("Tamaño: $cartProductSize"),
                  ),

                  Expanded(
                    child: Text("Color: $cartProductColor"),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 6),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(cartProductPrice.toString()+"€",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

