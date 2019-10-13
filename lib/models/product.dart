class Product {
  final String title;
  final String imgUrl;
  final String value;
  final String currency;
  final String city;
  final String state;
  final String country;
  final String description;

  Product(
    this.title, 
    this.imgUrl, 
    this.value,
    this.currency,
    this.city,
    this.state,
    this.country, 
    this.description
    );

   Product.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imgUrl = json['imgUrl'],
        value = json["value"],
        currency = json["currency"],
        city = json["city"],
        state = json["state"],
        country = json["country"],
        description = json["description"];
    

  Map<String, dynamic> toJson() =>
    {
      'name': title,
      'imgUrl': imgUrl,
      'value': value,
      'currency': currency,
      'city': city,
      'state': state,
      'country': country,
      'description': description,
    };
}