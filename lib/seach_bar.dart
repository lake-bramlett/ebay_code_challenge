import 'package:ebay_challenge/screens/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchBar extends StatefulWidget {
  @override
  SearchBarState createState() => new SearchBarState();
}

class SearchBarState extends State<SearchBar> {

// API Call
  Future<String> getData() async {
    List productDataList;
    var response = await http.get(
      Uri.encodeFull("https://swapi.co/api/people/"),
      headers: {
        "Accept": "application/json"
      }
    );

    if (response.statusCode == 200 ) {
      var data = json.decode(response.body);
      productDataList = data["results"];
      print(productDataList.runtimeType);
      
      //Handle redirect to ProductList
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductList(products: productDataList), 
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) { getData(); },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Search Products'
      )
    );
  }
}