import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import './product_detail.dart';
import './../../api.dart';

class ProductList extends StatefulWidget {
  final List products;
  String nextPage;
  ProductList({Key key, this.products, this.nextPage}) : super(key: key);

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
  void initState() {
    super.initState();
    _scrollController.addListener((){
      // print(_scrollController.position.pixels);
      // print(_scrollController.position.maxScrollExtent * .8);
      if(_scrollController.position.pixels == (_scrollController.position.maxScrollExtent)){
      _addMoreProducts();
      }
    });
  }

  void _addMoreProducts() async {
    if (widget.nextPage == null) {
      // there are no more pages
      return;
    }
    var response = await Api.getData(widget.nextPage);
    setState(() {
      widget.products.addAll(response.results);
      widget.nextPage = response.nextPage;
    });
    
  }

  @override
  Widget build(BuildContext context) {
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