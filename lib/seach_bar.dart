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
      onSubmitted: (value) { _searchAndRedirect(); },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Search Products'
      )
    );
  }

  void _searchAndRedirect() async {
    var response = await Api.getData("https://swapi.co/api/people");
    //Handle redirect to ProductList
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductList(products: response.results, nextPage: response.nextPage), 
        ),
    );
  }

}