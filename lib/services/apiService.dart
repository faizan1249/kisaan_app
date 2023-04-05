// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_chatgpt/models/model_list_model.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class ApiBaseHelper {
//   static const String baseUrl = "https://api.openai.com/v1/";
//   static const String TOKEN =
//       "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";

//   Future<dynamic> get(String endPoint) async {
//     dynamic jsonResponse;

//     try {
//       http.Response ApiResponse =
//           await http.get(Uri.parse(baseUrl + endPoint), headers: {
//         'Authorization': 'Bearer $TOKEN',
//       });
//       jsonResponse = _returnResponse(ApiResponse);
//     } on TimeoutException {
//       Fluttertoast.showToast(
//           msg: "Something went wrong, your internet may be slow");
//     }

//     return jsonResponse;

//     // return ;
//   }

//   static Future<dynamic> post(
//       String endpoint, Map<String, dynamic> data) async {
//     http.Response ApiResponse = await http.post(Uri.parse(baseUrl + endpoint),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(data));
//   }

//   dynamic _returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         return response.body;
//       case 201:
//         return response.body;
//       case 202:
//         return response.body;
//       case 203:
//         return response.body;
//       case 204:
//         return response.body;
//     }
//   }
// }
