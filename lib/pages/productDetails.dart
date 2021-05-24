import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPic;
  final productDetailOldPrice;
  final productDetailPrice;

  ProductDetails(
      {this.productDetailName,
      this.productDetailOldPrice,
      this.productDetailPic,
      this.productDetailPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange,
        title: Center(
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset('assets/logo.png',
                  fit: BoxFit.contain, height: 45),
            )),
        actions: [
          IconButton(
            //SEARCH BUTTON
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            //CART BUTTON
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.productDetailPic),
              ),
              footer: Container(
                color: Colors.orange.withOpacity(0.7),
                child: ListTile(
                  title:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.productDetailName, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(width: 25.0),
                      Text(widget.productDetailPrice.toString()+"€", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(widget.productDetailName,
                  //         style: TextStyle(fontWeight: FontWeight.bold)),
                  //     SizedBox(width: 230),
                  //     Text(widget.productDetailPrice.toString() + '€',
                  //         style: TextStyle(fontWeight: FontWeight.bold)),
                  //   ],
                  // ),
                ),
              ),
            ),
          ),

          //---------------------- Buttons -------------------------------

          //--------------------QUANTITY---------------------------------
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Cantidad"),
                            content: Text("Elige la cantidad"),
                            actions: [
                              MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Cerrar"),)
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Cantidad"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down_sharp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //------------------------------ Second buttons ---------------------
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.orange,
                  textColor: Colors.black,
                  child: Text("COMPRAR YA"),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),

          Divider(color: Colors.orange,),
          ListTile(
            title: Text("Descripción del producto"),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
          ),
          Divider(color: Colors.orange,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Nombre del producto", style: TextStyle(fontWeight: FontWeight.bold),),),
              Padding(padding: EdgeInsets.fromLTRB(12,5,5,5),
              child: Text(widget.productDetailName),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Marca", style: TextStyle(fontWeight: FontWeight.bold)),),
              Padding(padding: EdgeInsets.fromLTRB(12,5,5,5),
                child: Text("Kome"),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Condición", style: TextStyle(fontWeight: FontWeight.bold)),),
              Padding(padding: EdgeInsets.fromLTRB(12,5,5,5),
                child: Text("Nuevo"),)
            ],
          ),
        ],
      ),
    );
  }
}
