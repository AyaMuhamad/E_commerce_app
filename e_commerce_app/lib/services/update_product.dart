import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService{
  Future<ProductModel> updateproduct({
    required title,
    required int id,
    required String price,
    required String disc,
    required String image, required String category,
    // required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/${id}', body: {
      'title': title,
      'price': price,
      'description': disc,
      'image': image,
      // 'category': category,
    });
    return ProductModel.fromjon(data);
  }
}