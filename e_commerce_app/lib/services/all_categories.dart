import 'dart:convert';
import 'package:e_commerce_app/helper/api.dart';
import 'package:http/http.dart';

class AllCategoriesServices {
  Future<List<dynamic>> allCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
        
      return data;
  }
}
