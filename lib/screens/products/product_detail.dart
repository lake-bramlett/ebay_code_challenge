import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class ProductDetail extends StatefulWidget {

  final product;
  final productTerm;

  ProductDetail({Key key, this.product, this.productTerm}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.product.title);
    print(widget.product.description);
    return Scaffold (
      appBar: AppBar(
        title: Text('Back to "${widget.productTerm}" results'),
      ),
      body: ListView(
        children: <Widget>[
          Container(child: 
            Text(
              "${widget.product.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(child:
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "${widget.product.description}",
              ),
            ),
          ),
          Container(child: Image.network(widget.product.imgUrl),),
          ],
        ),
      );
  }
}
