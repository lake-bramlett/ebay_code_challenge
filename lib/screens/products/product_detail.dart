import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import '../home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatefulWidget {

  final product;
  final productTerm;
  var productImage;
  // int imageIndex = 0; // Uncomment for image by tap functionality

  ProductDetail({Key key, this.product, this.productTerm, this.productImage}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {


  // method for cycling through images by tap gesture
  //
  // _getNextProductImage() {
  //   if(widget.imageIndex != widget.product.moreImageUrls.length -1){
  //     print(widget.product.moreImageUrls);
  //     print('next image url: ${widget.product.moreImageUrls[widget.imageIndex]}');
  //     setState(() {
  //       widget.productImage = widget.product.moreImageUrls[widget.imageIndex];
  //       print(widget.productImage);
  //     });
  //     widget.imageIndex += 1; 
  //   } else {
  //     setState(() {
  //       widget.productImage = widget.product.initialImageUrl;
  //     });
  //     widget.imageIndex = 0;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print(widget.product.title);
    print(widget.product.description);
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
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
          Container(
            child: 
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children:[
                  //uncomment code below to enable image change on tap
                  //
                  // GestureDetector(
                  //   onTap: () {
                  //     _getNextProductImage();
                  //   },
                  //   child: Image.network(widget.productImage),
                  // ),
                  CarouselSlider(
                    height: 300.0,
                    items: [widget.product.initialImageUrl, ...widget.product.moreImageUrls].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[850]
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          height: 400.0,
                                          width: 400.0,
                                          child: FittedBox(
                                            child: Image.network(i),
                                            fit: BoxFit.fitWidth,
                                          )
                                        )
                                      );
                                    }
                                  );
                                },
                                child: Image.network(i),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Text(
                    "Swipe for more photos",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ]
            ),
          ),
          ),
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
          Divider(
            color: Colors.grey[850],
            indent: 30.0,
            endIndent: 30.0,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(children: <Widget>[
                Text(
                  widget.product.description,
                ),
                Row(children: <Widget>[
                  Text(
                    "Price: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    widget.product.value
                  ),
                  Text(
                    widget.product.currency
                  ),
                ],),
                Row(children: <Widget>[
                  Text(
                    "Location: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    "${widget.product.city}, "
                  ),
                  Text(
                    "${widget.product.state}, "
                  ),
                  Text(
                    widget.product.country
                  ),
                ],)
              ],)
            ),
          ),
          ],
        ),
      );
  }
}
