import 'package:e_commerce_app/Screens/home_page.dart';
import 'package:e_commerce_app/Screens/update_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id : (context)=>  HomePage(),
        UpdateProductPage.id :(context)=> UpdateProductPage(),
      },
      initialRoute: UpdateProductPage.id,
    );
  }
}

