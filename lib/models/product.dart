class Product {
  final String title;
  final String initialImageUrl;
  final List moreImageUrls;
  final String value;
  final String currency;
  final String city;
  final String state;
  final String country;
  final String description;

  static const String keyTitle = "title";
  static const String keyImage = "image";
  static const String keyImageUrl = "imageUrl";
  static const String keyMoreImageUrls = "additionalImages";
  static const String keyPrice = "price";
  static const String keyPriceValue = "value";
  static const String keyPriceCurrency ="currency";
  static const String keyItemLoc = "itemLocation";
  static const String keyItemLocCity = "city";
  static const String keyItemLocStateProv = "stateOrProvince";
  static const String keyItemLocCountry = "country";
  static const String keyDesc = "shortDescription";

  Product(
    this.title, 
    this.initialImageUrl,
    this.moreImageUrls,
    this.value,
    this.currency,
    this.city,
    this.state,
    this.country, 
    this.description
    );

   factory Product.fromJson(Map<String, dynamic> json) {
     /* sometimes the sandbox api data differs in format of the returned response than the production api. This factory seems overly complicated, but it should account for, and handle, the differences between the sandbox and production apis
     */
     var title = json[keyTitle];

     var initialImageUrl = "";
     if (json[keyImage] != null && (json[keyImage][keyImageUrl] != null)) {
       initialImageUrl = json[keyImage][keyImageUrl];
     }

    var moreImageUrls = [];
    if (json[keyMoreImageUrls] != null) {
      moreImageUrls = json[keyMoreImageUrls].map((url) => url["imageUrl"]).toList();
    };

     var value = "unknown";
     var currency  = "";

     if(json[keyPrice] != null){
       if(json[keyPrice][keyPriceValue] != null) {
         value = json[keyPrice][keyPriceValue];
       }
       if(json[keyPrice][keyPriceCurrency] != null) {
         currency = json[keyPrice][keyPriceCurrency];
       }
     }
  
     var city = "unknown";
     var state = "";
     var country = "";

     if(json[keyItemLoc] != null) {
      if (json[keyItemLoc][keyItemLocCity] != null) {
        city = json[keyItemLoc][keyItemLocCity];
      }
      if (json[keyItemLoc][keyItemLocStateProv] != null) {
        state = json[keyItemLoc][keyItemLocStateProv];
      }
      if (json[keyItemLoc][keyItemLocCountry] != null) {
        country = json[keyItemLoc][keyItemLocCountry];
      }
     }

     var description = "no description available";
     if (json[keyDesc] != null) {
       description = json[keyDesc];
     }

     return Product(
       title, 
       initialImageUrl,
       moreImageUrls,
       value,
       currency,
       city,
       state,
       country,
       description
     );
   }
    

  Map<String, dynamic> toJson() =>
    {
      'name': title,
      'initialImageUrl': initialImageUrl,
      'moreImageUrls': moreImageUrls,
      'value': value,
      'currency': currency,
      'city': city,
      'state': state,
      'country': country,
      'description': description,
    };
}