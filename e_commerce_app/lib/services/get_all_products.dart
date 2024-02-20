// import 'package:e_commerce_app/helper/api.dart';
// import 'package:e_commerce_app/models/product_model.dart';

// class AllProductsServices {
//   Future<List<ProductModel>> getAllProducts() async {
//     List<dynamic> data =
//         await Api().get(url: 'https://fakestoreapi.com/products');
//     // print('########################################');
//     // print(data);
//     List<ProductModel> productsList = [];
//     for (int i = 0; i < data.length; i++) {
//       // print(productsList[i]);
//       productsList.add(
//         ProductModel.fromjon(data[i]),
//       );
//     }
//     // print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
//     // print(productsList);
//     return productsList;
//   }
// }


import '../helper/api.dart';
import '../models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
         ProductModel.fromjon(data[i]),
      );
    }
    return productsList;
  }
}
