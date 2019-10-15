import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import '../home.dart';

class ProductDetail extends StatefulWidget {

  final product;
  final productTerm;
  var productImage;
  int imageIndex = 0;

  ProductDetail({Key key, this.product, this.productTerm, this.productImage}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  @override

  _getNextProductImage() {
    if(widget.imageIndex != widget.product.moreImageUrls.length -1){
      print(widget.product.moreImageUrls);
      print('next image url: ${widget.product.moreImageUrls[widget.imageIndex]}');
      setState(() {
        widget.productImage = widget.product.moreImageUrls[widget.imageIndex];
        print(widget.productImage);
      });
      widget.imageIndex += 1; 
    } else {
      setState(() {
        widget.productImage = widget.product.initialImageUrl;
      });
      widget.imageIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.product.title);
    print(widget.product.description);
    return Scaffold (
      appBar: AppBar(
        title: Text('Back to "${widget.productTerm}" results'),
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
      body: ListView(
        children: <Widget>[
          Container(child: 
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "${widget.product.title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
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
          Container(
            child: 
            Padding(
              padding: EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  _getNextProductImage();
                },
                child: Image.network(widget.productImage),
              ),
            )
          ),
          ],
        ),
      );
  }
}
