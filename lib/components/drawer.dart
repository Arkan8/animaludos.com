import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerAnimaludos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            //header
            UserAccountsDrawerHeader(
              accountName: Text("Arkan8Nox", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              accountEmail: Text("arkan8guardian@gmail.com", style: TextStyle(color: Colors.black)),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ),
              decoration: BoxDecoration(color: Colors.orange),
            ),
            //BODY------------
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.orange),
                title: Text("Inicio"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.account_circle_rounded, color: Colors.orange),
                title: Text("Mi cuenta"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.shopping_basket, color: Colors.orange),
                title: Text("Mis pedidos"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.orange),
                title: Text("Carrito de la compra"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.orange),
                title: Text("Favoritos"),
              ),
            ),

            Divider(
              thickness: 3,
              indent: 13,
              endIndent: 13,
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.orange),
                title: Text("Preferencias"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.help, color: Colors.blue),
                title: Text("Ayuda"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
