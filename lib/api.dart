import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api {

  static Future<QueryResult> getData(String url) async {
    var token = "v^1.1#i^1#I^3#p^1#r^0#f^0#t^H4sIAAAAAAAAAOVYa2wUVRTu9oUNFHwQXgVTBo0IzOy9M/ucdJdsW6Brlu7KdgsUobkzc7cdd3ZmnLlLuz5rgxBBg5pgNL5IVAQU4gOERH9ANISYiAZDjIolEBBjIFowYvijM9tStpW0SDfYxP2zmXPPPfc733fOvXcGdJVXzFvfsP5SpWNc8dYu0FXscMDxoKK8bP7EkuIZZUUgz8GxteuurtLukp9rTJRWdH4ZNnVNNXF1Z1pRTT5nDFAZQ+U1ZMomr6I0Nnki8vHQ0gjPMoDXDY1ooqZQ1eH6AMVhzEkcB1i/W+QQ9lpW9UrMJi1AIeCFSIJJIen2CH7RY42bZgaHVZMglQQoFkA/DQENuSbA8sDHs36GhWwLVd2MDVPWVMuFAVQwB5fPzTXysA4PFZkmNogVhAqGQ4vj0VC4flFjU40zL1awn4c4QSRjDn6q0yRc3YyUDB5+GTPnzcczoohNk3IG+1YYHJQPXQFzA/BzVHu8CCLBh72cBwrYJRSEysWakUZkeBy2RZboZM6VxyqRSXYkRi02hAexSPqfGq0Q4fpq++/+DFLkpIyNALWoNrQyFItRwQhK4VoDpekwwemIpqXo2LJ6Oom8LMtKkKMBhAh6vaB/ob5o/TQPWalOUyXZJs2sbtRILbZQ48HcQN6dx43lFFWjRihJbET5fq4rHAJPiy1qn4oZ0q7auuK0RUR17nFkBQZmE2LIQobggQhDB3IUWW2j67JEDR3M1WJ/+XSaAaqdEJ13Ojs6OpgOjtGMNicLAHSuWBqJi+04jSjL1+71Pn955Am0nEtFxNZMU+ZJVrewdFq1agFQ26igC0A34Pp5HwwrONT6D0Nezs7BHVGoDhFFa6fx+qSkwEpAdLkK0SHB/iJ12jiwgLJ0GhkpTHQFiZgWrTrLpLEhSzznTrKcL4lpyeNP0i5/MkkLbslDwyTGAGNBEP2+/1OjXG+px7FoYFKQWi9YnXfIdf66NKvHmldonYmlvixm7/M6l0B2bcw3X1pO2hRBDbezrkQdCFxvN1w7eVHTcUxTZDFbAAbsXi8gC5whxZBBsnGsKJZhVImadqJjS2R7vmkFQLrM2I3NiFraqSFrR7dNrTnEo8o5pOvhdDpDkKDgcGF28/9oJ79merJ11xlTOVn69QkpS32XFCanJmOuFRkDm1rGsO5nTNQ+s5u0FFatHZAYmqJgoxmOWuibra/d6yPw8S8PixvLvXA3lbFU26IiWyXUOtYyuymKymiMncbQ7QV+jnUD/6jyqstp2pQda+dQg2YSLA2XWumSG7xWOwe/5AeLcj/Y7dgLuh0fFDscwAnuhnPA7PKSRGnJhBmmTDAjoyRjym2q9e5qYCaFszqSjeJyh/zC0Q3H8j4rbF0Npg18WKgogePzvjKAmVdHyuCkqZXQDwHkAAt8rL8FzLk6WgqnlE7+cV2KeTdxuaE3En3jpejlRw7VROeBygEnh6OsqLTbUfSotnnnrnNLog1l9HutFWVfPZN42nVkf82aX3ds+vjPe5Yd3u38Y+G6tdOqXJWk+eCC7W81TZq8papm1Z3TX288cOGdPbtrjrbuqX1s17ziVHxTx94vTwRO9K5OHDyzb3dEPJK65ezn9Qu+mPnqQnf5rIuZxPs9RT98dsdv5rm57Rtnnlmn9Nx24dPyqifPnqzdWb9t4rPxh587WX9aXrN56vHS16YHZv3yYiB4eEbLQz0Tnv8JtG4X/tKn7Njw/Yed3z3Ozbn34iv81/tPxSMNMc9T357uiWw7cMhz+6rWXrjlk0uJza7fqfNHsv43q+YePrPx7cpTD2yc3XB++8sNsQUHPfuOffPErR8tPz59Qm/xuJV98v0NIMtPm/ARAAA=";
    print(url);
    List productDataList;
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Accept": "application/json"
      }
    );

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
}

class QueryResult {
  List results;
  String nextPage;

  QueryResult(this.results, this.nextPage);
}
