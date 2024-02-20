import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/get_all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            List<ProductModel>? products = snapshot.data;
            // print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
            // print(products);
            return GridView.builder(
              itemCount: products?.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100),
              itemBuilder: (context, index) {
                return CustomCard(
                  prodct: products![index],
                );
              },
            );
            // } else {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
          },
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// import '../models/product_model.dart';
// import '../services/get_all_products.dart';
// import '../widgets/custom_card.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   static String id = 'HomePAge';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.shopping_bag,
//                 color: Colors.black,
//               ))
//         ],
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'New Trend',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
//         child: FutureBuilder<List<ProductModel>>(
//           future: AllProductsServices().getAllProducts(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<ProductModel> products = snapshot.data!;
//               return GridView.builder(
//                   itemCount: products.length,
//                   clipBehavior: Clip.none,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 1.5,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 100,
//                   ),
//                   itemBuilder: (context, index) {
//                     return CustomCard(prodct: products[index]);
//                   });
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
