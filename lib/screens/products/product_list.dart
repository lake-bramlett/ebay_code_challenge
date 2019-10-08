import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import './product_detail.dart';

class ProductList extends StatefulWidget {
  final List products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}


class _ProductListState extends State<ProductList>{

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(widget.products[index]["name"]),
              subtitle: Text(widget.products[index]["gender"]),
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(product: widget.products[index]), 
                  ),
                );
              },
            );
          },)
      //   child: Column (children: <Widget>[
      //   GestureDetector(
      //     onTap: () {
      //       print(widget.products[0].runtimeType);
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => ProductDetail(product: widget.products[0]), 
      //         ),
      //       );
      //     },
      //     child: Text("${widget.products[0]["name"]}"),
      //     ),
      //   Text("${widget.products[1]["name"]}"),
      //   Text("${widget.products[2]["name"]}"),
      //   Text("${widget.products[3]["name"]}")
      // ],),
        )
    );
  }
}