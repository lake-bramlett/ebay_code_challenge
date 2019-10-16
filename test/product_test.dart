import 'package:flutter_test/flutter_test.dart';
import '../lib/models/product.dart';

void main() {
  final product = Product("Test Title", "Test Initial Image Url", ["Another Test Image Url", "And another Test Image Url, And yet another Test Image Url"], "Test Value", "Test Currency", "Test City", "Test State",
      "Test Country", "Test short description here");
  test('should create a new product using the product model', () {
    expect(product.title, "Test Title");
    expect(product.initialImageUrl, "Test Initial Image Url");
    expect(product.moreImageUrls, ["Another Test Image Url", "And another Test Image Url, And yet another Test Image Url"]);
    expect(product.value, "Test Value");
    expect(product.currency, "Test Currency");
    expect(product.city, "Test City");
    expect(product.state, "Test State");
    expect(product.country, "Test Country");
    expect(product.description, "Test short description here");
  });
}