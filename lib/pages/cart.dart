import 'package:flutter/material.dart';
import 'package:animaludos/components/cartProducts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
        ],
      ),

      body: CartProducts(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text("200€"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text("Finalizar compra",),
                color: Colors.orange,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
