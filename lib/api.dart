import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import './models/product.dart';

class ApiConfig {
  // sandbox api
  // static const baseUrl = "https://api.sandbox.ebay.com";
  // static const clientId = "";
  // static const clientSecret = "";
  // 
  // production api
  static const baseUrl = "https://api.ebay.com";
  static const clientId = "";
  static const clientSecret = "";
  static String authHeader(){
    return "Basic " + base64.encode(utf8.encode("$clientId:$clientSecret"));
  }
}

class Api {

  static var _token;


  // get oauth token
  static Future<String> getToken() async {
    print("step one");
    if(_token != null){
      print("t1");
      return _token;
    }
    print("t1.5");
    var url = Uri.encodeFull(ApiConfig.baseUrl + "/identity/v1/oauth2/token");
    print(url);
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: ApiConfig.authHeader(),
        'Content-Type': 'application/x-www-form-urlencoded', 
      }, 
      body: {
        'grant_type': 'client_credentials',
        'scope': 'https://api.ebay.com/oauth/api_scope'
      }
    );
    print("t2");

    print("token response: ${response.statusCode}");
    print(response.body);
    
    if (response.statusCode == 200) {
      print("t3");
      var data = json.decode(response.body);
      var newToken = data["access_token"];
      _token = newToken;
      return _token;
    } else {
      print("t4");
      throw("failed to get token. status code: ${response.statusCode}");
    }

  }


  // get initial array of products
  static Future<QueryResult> getFirstProducts(String query) {
    var url = "${ApiConfig.baseUrl}/buy/browse/v1/item_summary/search?q=$query";
    return getProducts(url);
  }


  // get products 
  static Future<QueryResult> getProducts(String url) async {
    print(url);
    var token  = await getToken();
    List productDataList;
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Accept": "application/json"
      }
    );

    print(response.statusCode);

    if (response.statusCode == 200 ) {
      var data = json.decode(response.body);
      var nextUrl = data["next"];
      productDataList = data["itemSummaries"];
      print(productDataList);
      return QueryResult(productDataList, nextUrl);
    } else {
      throw("failed. status code: ${response.statusCode}");
    }
  }


  // get product detail 
  static Future<Product> getProductDetail(String url) async {
    var token = await getToken();
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Accept": "application/json"
      }
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var product = Product.fromJson(data);//(data["title"], data["image"]["imageUrl"], data["price"]["value"], data["price"]["currency"], data["itemLocation"]["city"], data["itemLocation"]["stateOrProvince"], data["itemLocation"]["country"], data["shortDescription"]);
      return product;
    } else {
      throw("no product returned. error code: ${response.statusCode}");
    }
  }
}



class QueryResult {
  List results;
  String nextPage;

  QueryResult(this.results, this.nextPage);
}
