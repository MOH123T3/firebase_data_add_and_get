import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProviderController with ChangeNotifier {
  String url = 'https://jsonplaceholder.typicode.com/comments';

  Dio dio = Dio();

  List userModelList = [];
  getData() async {
    var response = await dio.get(url);
    userModelList = response.data;

    notifyListeners();
  }
}
