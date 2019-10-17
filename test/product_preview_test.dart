import 'package:flutter_test/flutter_test.dart';
import '../lib/models/product_preview.dart';

void main() {
  test('should create a new product preview using the product_preview model', () {
    
    final productPreview = ProductPreview("Test Title", "Test ID", "Test Image Url", "Test Value", "Test Currency", "Test Product Detail Href");

    expect(productPreview.title, "Test Title");
    expect(productPreview.id, "Test ID");
    expect(productPreview.imageUrl, "Test Image Url");
    expect(productPreview.value, "Test Value");
    expect(productPreview.currency, "Test Currency");
    expect(productPreview.productDetailHref, "Test Product Detail Href");
  });

  test('should create a new product preview using the product_preview model from Json data', () {

  final productPreview = ProductPreview.fromJson({"title": "Test Title", "itemId": "Test ID", "image": {"imageUrl": "Test Image Url"}, "price":{"value":"Test Value", "currency":"Test Currency"}, "itemHref": "Test Product Detail Href"});

  expect(productPreview.title, "Test Title");
  expect(productPreview.id, "Test ID");
  expect(productPreview.imageUrl, "Test Image Url");
  expect(productPreview.value, "Test Value");
  expect(productPreview.currency, "Test Currency");
  expect(productPreview.productDetailHref, "Test Product Detail Href");
  });
}