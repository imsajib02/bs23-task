import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/models.dart';
import '../../../barrels/repositories.dart';
import '../../../barrels/utils.dart';

class HomeController extends GetxController {

  var index = 0.obs;
  var productList = <Product>[].obs;
  var _homeRepo = getIt<HomeRepository>();

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void retry() {
    index.value = 0;
    getList();
  }

  Future<void> getList() async {

    try {
      var response = await _homeRepo.getList();

      var jsonData = json.decode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {

        if(jsonData['products'] != null) {
          productList.value = List<Product>.from(jsonData['products'].map((json) => Product.fromJson(json)));
          index.value = 1;
          return;
        }

        if(parseError(response) != null) {
          onFailure(parseError(response)!);
          return;
        }

        index.value = 2;
        return;
      }

      if(parseError(response) != null) {
        onFailure(parseError(response)!);
        return;
      }

      index.value = 2;

    } on AppException catch(error) {
      onFailure(error.message!);

    } catch(error) {
      onFailure(STR_UNKNOWN_ERROR.tr);
    }
  }

  void onFailure(String message) {
    index.value = 2;
    Get.snackbar(message, '', snackPosition: SnackPosition.BOTTOM, colorText: Colors.white, backgroundColor: Colors.black, borderColor: Colors.white);
  }
}