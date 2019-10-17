class ProductPreview {
  final String title;
  final String id;
  final String imageUrl;
  final String value;
  final String currency;
  final String productDetailHref;


  static const String keyTitle = "title";
  static const String keyId = "itemId";
  static const String keyImage = "image";
  static const String keyImageUrl = "imageUrl";
  static const String keyPrice = "price";
  static const String keyPriceValue = "value";
  static const String keyPriceCurrency = "currency";
  static const String keyProductDetailHref = "itemHref";

  ProductPreview(
    this.title, 
    this.id, 
    this.imageUrl,
    this.value,
    this.currency,
    this.productDetailHref,
    );

   factory ProductPreview.fromJson(Map<String, dynamic> json) {
     /* sometimes the sandbox api data differs in format of the returned response than the production api. This factory seems overly complicated, but it should account for, and handle, the differences between the sandbox and production apis
     */
     var title = json[keyTitle];

     var id = json[keyId];

     var imageUrl = "";
     if (json[keyImage] != null && (json[keyImage][keyImageUrl] != null)) {
       imageUrl = json[keyImage][keyImageUrl];
     }

     var value = "unknown";
     var currency = "";

     if(json[keyPrice] != null){
       if(json[keyPrice][keyPriceValue] != null) {
         value = json[keyPrice][keyPriceValue];
       }
       if(json[keyPrice][keyPriceCurrency] != null) {
         currency = json[keyPrice][keyPriceCurrency];
       }
     }

     var productDetailHref = json[keyProductDetailHref];
  
     return ProductPreview(
       title, 
       id,
       imageUrl,
       value,
       currency,
       productDetailHref,
     );
   }
  
}