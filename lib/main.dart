import 'package:ebay_challenge/screens/products/product_list.dart';
import 'package:ebay_challenge/screens/products/product_detail.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp( 
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/products': (context) => ProductList(),
        '/product': (context) => ProductDetail(),
      }
    )
  );
}