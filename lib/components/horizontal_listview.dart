import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(imgLocation: 'assets/cats/perro.png', imgCaption: 'PERROS'),
          Category(imgLocation: 'assets/cats/gato.png', imgCaption: 'GATOS'),
          Category(imgLocation: 'assets/cats/pajaro.png', imgCaption: 'OTROS'),
          Category(imgLocation: 'assets/cats/persona.png', imgCaption: 'PARA TI'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imgLocation;
  final String imgCaption;

  Category({required this.imgLocation, required this.imgCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(imgLocation, width: 100, height: 70),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(imgCaption, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
                )),
            ),
          ),
        ),
      ),
    );
  }
}
