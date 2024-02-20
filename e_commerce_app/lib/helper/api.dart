// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class Api {
//   Future<dynamic> get({required String url}) async {
//     http.Response response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('problem in status code ${response.statusCode}');
//     }
//   }

//   Future<dynamic> post({required String url, @required dynamic body}) async {
//     Response response = await http.post(
//       Uri.parse(url),
//       body:
//           // {
//           //   'title': 'test product',
//           //   'price': '13.5',
//           //   'description': 'lorem ipsum set',
//           //   'image': ' https://i.pravatar.cc',
//           //   'category': 'electronic',
//           // }
//           body,
//     );
//     if (response == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return data;
//     } else {
//       // throw Exception(jsonDecode(response.body));
//       throw Exception(response.statusCode);
//     }
//   }

//    Future<dynamic> put({required String url, @required dynamic body}) async {
//     Response response = await http.post(
//       Uri.parse(url),
//       body:
//           // {
//           //   'title': 'test product',
//           //   'price': '13.5',
//           //   'description': 'lorem ipsum set',
//           //   'image': ' https://i.pravatar.cc',
//           //   'category': 'electronic',
//           // }
//           body,
//     );
//     if (response == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return data;
//     } else {
//       // throw Exception(jsonDecode(response.body));
//       throw Exception(response.statusCode);
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
