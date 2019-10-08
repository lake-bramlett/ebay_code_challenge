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

  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
       //insert scroll event 
      }
    });
    return Scaffold (
      body: SafeArea(
        child: ListView.builder(
          controller: _scrollController,
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
        )
    );
  }
}