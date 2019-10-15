class ProductPreview {
  final String title;
  final String id;
  final String imageUrl;
  final String productDetailHref;


  static const String keyTitle = "title";
  static const String keyId = "itemId";
  static const String keyImage = "image";
  static const String keyImageUrl = "imageUrl";
  static const String keyProductDetailHref = "itemHref";

  ProductPreview(
    this.title, 
    this.id, 
    this.imageUrl,
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

     var productDetailHref = json[keyProductDetailHref];
  
     return ProductPreview(
       title, 
       id,
       imageUrl,
       productDetailHref,
     );
   }
    

  Map<String, dynamic> toJson() =>
    {
      'tite': title,
      'id': id,
      'imageUrl': imageUrl,
      'productDetailHref': productDetailHref,
    };
}