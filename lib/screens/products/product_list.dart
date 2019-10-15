import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import './product_detail.dart';
import './../../api.dart';
import '../home.dart';
import './../../models/product_preview.dart';




class ProductList extends StatefulWidget {
  final List<ProductPreview> products;
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

  //function to handle infinite scroll
  void _addMoreProducts() async {
    if (widget.nextPage == null) {
      // there are no more pages
      return;
    }
    var response = await Api.getProducts(widget.nextPage);
    print(response.results.runtimeType);
    
    setState(() {
      widget.products.addAll(response.results);
      widget.nextPage = response.nextPage;
    });
    
  }

  void _getProductDetailOnTap(productUrl) async {
    var product =  await Api.getProductDetail(productUrl);
    print(product.initialImageUrl);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(product: product, productTerm: widget.searchInput, productImage: product.initialImageUrl)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Showing results for "${widget.searchInput}"'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  )
                );
              },
          )
        ]
      ),
      body: SafeArea(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            print(widget.products[index]);
            return Card (
              child: ListTile(
                title: Text(widget.products[index].title),
                subtitle: Text(widget.products[index].id),
                trailing: Image.network(widget.products[index].imageUrl,),
                onTap: () {
                  print("item href: ${widget.products[index].productDetailHref}");
                  _getProductDetailOnTap(widget.products[index].productDetailHref);
                },
              ),
            );
          },)
        )
    );
  }
}