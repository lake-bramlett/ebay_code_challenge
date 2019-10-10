import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import './product_detail.dart';
import './../../api.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import './../../search_bar.dart';




class ProductList extends StatefulWidget {
  final List products;
  String nextPage;
  String searchInput;

  ProductList({Key key, this.products, this.nextPage, this.searchInput}) : super(key: key);

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

  void _getProductDetail(productUrl) async {
    var response = await http.get(
      Uri.encodeFull(productUrl),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${token}",
        "Accept": "application/json"
      }
    );

    if (response.statusCode == 200 ) {
      var data = json.decode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(product: data, productTerm: widget.searchInput)
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Showing results for "${widget.searchInput}"'),
      ),
      body: SafeArea(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Card (
              child: ListTile(
                title: Text(widget.products[index]["title"]),
                subtitle: Text(widget.products[index]["itemId"]),
                trailing: Image.network(widget.products[index]["image"]["imageUrl"],),
                onTap: () {
                  print("item href: ${widget.products[index]["itemHref"]}");
                  _getProductDetail(widget.products[index]["itemHref"]);
                },
              ),
            );
          },)
        )
    );
  }
}