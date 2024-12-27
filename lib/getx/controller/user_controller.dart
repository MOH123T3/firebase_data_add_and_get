import 'dart:convert';
import 'dart:io';

import 'package:form_view/getx/model/user_model.dart';
import 'package:form_view/provider/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxString url = "https://fakestoreapi.com/products".obs;
  RxList<UserModelData> userModelList = <UserModelData>[].obs;

  getData() async {
    var response = await http.get(Uri.parse(url.toString()));

    List userModelDataListData = jsonDecode(response.body);
    print(userModelDataListData.length);

    for (var i = 0; i < userModelDataListData.length; i++) {
      userModelList.add(UserModelData(
        category: userModelDataListData[i]['category'],
        description: userModelDataListData[i]['description'],
        id: userModelDataListData[i]['id'],
        image: userModelDataListData[i]['image'],
        price: userModelDataListData[i]['price'],
        rating: userModelDataListData[i]['Rating'],
        title: userModelDataListData[i]['title'],
      ));
    }
  }
}
