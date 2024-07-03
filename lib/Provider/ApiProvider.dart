import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider_learn/Models/Product.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    getProducts();
  }

  String API = "https://fakestoreapi.com/products";
  List<Product> products = [];

  Future<void> getProducts() async {
    var response = await http.get(Uri.parse(API));
    var data = json.decode(response.body) as List;
    products = data
        .map(
          (productJSon) => Product.fromJson(productJSon),
        )
        .toList();
    notifyListeners();
    print(products.length);
  }
}
