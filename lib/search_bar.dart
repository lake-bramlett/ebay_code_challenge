import 'package:ebay_challenge/screens/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './api.dart';


class SearchBar extends StatefulWidget {
  @override
  SearchBarState createState() => new SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (inputValue) { _searchAndRedirect(inputValue); },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Search Products'
      )
    );
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