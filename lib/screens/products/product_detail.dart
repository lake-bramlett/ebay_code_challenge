import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class ProductDetail extends StatefulWidget {

  final product;

  ProductDetail({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Column(children: <Widget>[
          Text("${widget.product["name"]}"),
          Text("${widget.product["gender"]}")
          ],
        ),
      )
    );
  }
}
