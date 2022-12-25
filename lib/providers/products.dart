import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteProduct {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://dummy-shop-app-f3c0b-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'price': product.price,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite,
          }));
      var newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        price: product.price,
        description: product.description,
        imageUrl: product.imageUrl,
      );
      _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://dummy-shop-app-f3c0b-default-rtdb.firebaseio.com/products.json');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<Product> loadedData = [];
    extractedData.forEach((prodId, prodData) {
      loadedData.add(Product(
          id: prodId,
          title: prodData['title'],
          price: prodData['price'],
          description: prodData['description'],
          imageUrl: prodData['imageUrl'],
          isFavorite: prodData['isFavorite'],
      ));
    });
    _items = loadedData;
    notifyListeners();
  }

  Future<void> updateProduct(String id, Product product) async{

    final url =  Uri.parse('https://dummy-shop-app-f3c0b-default-rtdb.firebaseio.com/products/$id.json');
    await http.patch(url,body: json.encode({
      'description':product.description,
      'imageUrl': product.imageUrl,
      'price': product.price,
      'title':product.title,
    }));
    var prodIndex = _items.indexWhere((prod) => prod.id == id);
    _items[prodIndex] = product;
    notifyListeners();
  }

  void removeProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
