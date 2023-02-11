

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productapp/models/product.dart';
import 'package:productapp/models/productsorttype.dart';


class FakeData{
  static List<Product>products=[
  Product(name: "iPhone 14 Max", image: "assets/products/iphone14max.jpg", description: "256 gb ,3gb ram", price: 1499.00),
  Product(name: "Macbook pro 16 m2", image: "assets/products/applemacbookpro16m2.png", description: "16 gb ram ,m2 Max,1tb", price: 3499.00),
  Product(name: "Macbook pro 16 m1", image: "assets/products/macbookprom116.jpg", description: "16 ram gb ,m1 Max ,2tb", price: 2499.00),
  Product(name: "Samsung Galaxy A23", image: "assets/products/samsunggalaxys23.jpg", description: "128 gb ,super amoled display,12gb ram", price: 1699.00),
  Product(name: "Razor Blade 15", image: "assets/products/razorblade15.jpg", description: "Windows 11 ,Intel Core i9 13th generation,32gb ram", price: 3000.00),
  Product(name: "Razor Blade 17", image: "assets/products/razorblade17.jpg", description: "Windows 11 ,Intel Core i9 13th generation,64gb", price: 4499.00),
 
  ];
}