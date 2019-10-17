import 'package:ebay_challenge/screens/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './api.dart';


class SearchBar extends StatefulWidget {

  var searchInput;

  @override
  SearchBarState createState() => new SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 10.0),
        width: 300.0,
        child: TextField(
          onSubmitted: (inputValue) { _searchAndRedirect(inputValue); print(widget.searchInput); },
          onChanged: (inputValue) { widget.searchInput = inputValue; },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            hintText: 'Search Items'
          )
        ),
      ),
      GestureDetector(
        child: Icon(
          Icons.search,
          color: Colors.white),
        onTap: () { _searchAndRedirect(widget.searchInput); }
        )
    ],);
  }

  void _searchAndRedirect(input) async {
    var response = await Api.getFirstProducts(input);
    print("RESPONSE IS A: ${response.results.runtimeType}");
    //Handle redirect to ProductList
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductList(products: response.results, nextPage: response.nextPage, searchInput: input), 
        ),
    );
  }

}