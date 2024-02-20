import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addproduct({
    required title,
    required double price,
    required String disc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': disc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromjon(data);
  }
}
