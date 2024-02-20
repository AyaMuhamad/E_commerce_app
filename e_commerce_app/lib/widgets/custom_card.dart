// ignore_for_file: unnecessary_string_interpolations
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/update_product.dart';
import 'package:flutter/material.dart';

import '../Screens/update_product_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.prodct,
    super.key,
  });
  ProductModel prodct;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductPage.id,
          arguments: prodct,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        // alignment: Alignment.topCenter,
        // fit: StackFit.passthrough,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10),
              )
            ]),
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prodct.title.substring(0, 6),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${prodct.price.toString()} ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            right: 20,
            bottom: 85,
            child: Image.network(
              prodct.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
