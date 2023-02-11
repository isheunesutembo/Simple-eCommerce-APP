import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productapp/data/fakedata.dart';
import 'package:productapp/models/product.dart';
import 'package:productapp/models/productsorttype.dart';

final futureProductsProvider=FutureProvider<List<Product>>((ref)async{
  await Future.delayed(const Duration(seconds: 4));
  final sortType=ref.watch(productSortTypeProvider);
  switch(sortType){
    case
    ProductSortType.name:
    FakeData.products.sort((a,b)=>b.name.compareTo(a.name));
    break;
    case ProductSortType.price:
    FakeData.products.sort((a,b)=>a.price.compareTo(b.price));
  }
  return FakeData.products;
});