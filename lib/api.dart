import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static Future<QueryResult> getData(String url) async {
    print(url);
    List productDataList;
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json"
      }
    );

    if (response.statusCode == 200 ) {
      var data = json.decode(response.body);
      var nextUrl = data["next"];
      productDataList = data["results"];
      print(productDataList.runtimeType);
      return QueryResult(productDataList, nextUrl);
    } else {
      throw("failed. status code: ${response.statusCode}");
    }
  }
}

class QueryResult {
  List results;
  String nextPage;

  QueryResult(this.results, this.nextPage);
}
