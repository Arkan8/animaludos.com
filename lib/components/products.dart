import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Pienso",
      "picture": "assets/products/pienso.jpg",
      "oldprice": 29.99,
      "price": 19.99,
    },
    {
      "name": "Arnés",
      "picture": "assets/products/arnes.jpg",
      "oldprice": 24.99,
      "price": 14.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]['name'],
          productPic: productList[index]['picture'],
          productOldPrice: productList[index]['oldprice'],
          productPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPic;
  final productOldPrice;
  final productPrice;

  SingleProduct({this.productName, this.productPic, this.productOldPrice, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(productName, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              child: Image.asset(productPic, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
