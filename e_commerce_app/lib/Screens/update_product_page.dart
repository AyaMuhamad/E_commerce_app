import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/update_product.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({
    super.key,
  });
  static String id = 'UpdateProductage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, disc, image;

  String? price;
  late ProductModel product;
  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:const Text(
          'Update product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextField(
            onChanged: (data) {
              name = data;
            },
            hintText: 'Product title',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            inputType: TextInputType.number,
            onChanged: (data) {
              price = data;
            },
            hintText: 'Product price',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            onChanged: (data) {
              disc = data;
            },
            hintText: 'Product discreption',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            onChanged: (data) {
              image = data;
            },
            hintText: 'Product image',
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: 'Update',
            onTap: () {
              setState(() {});
              try {
                updateproduct();
                print('Sucess');
              } catch (e) {
                print(e.toString());
              }
              setState(() {});
            },
          ),
        ]),
      ),
    );
  }

  void updateproduct() {
    UpdateProductService().updateproduct(
      id:  product.id,
      title: name == null ? product.title : name!,
      price: price == null ? product.price : price!,
      disc: disc == null ? product.description : disc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
