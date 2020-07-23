import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/util/network/base_network.dart';
import 'package:product_app/util/network/network_error.dart';

class ProductSource {
  static ProductSource instance = ProductSource();

  Future loadListProduct() async {
    final jsonResult = await BaseNetworking.shared.get(partUrl: 'products');
    return _processListResponse(jsonResult);
  }

  Future loadDetailProduct(String productId) async {
    final response =
        await BaseNetworking.shared.get(partUrl: 'products/$productId');
    return _processResponse(response);
  }

  Future _processResponse(jsonResult) async {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        if (jsonResult.containsKey("data")) {
          final product = ProductModel().fromJson(jsonResult["data"]);
          return product;
        }

        if (jsonResult["code"] != 200) {
          if (jsonResult.containsKey('message')) {
            throw NetworkError.message = jsonResult['message'];
          } else {
            throw NetworkError.message = "Something wen't wrong";
          }
        }

        return ProductModel();
      },
    );
  }

  Future _processListResponse(jsonResult) async {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        List<ProductModel> result = [];

        for (var productJson in jsonResult['data']) {
          try {
            final product = ProductModel().fromJson(productJson);
            result.add(product);
          } catch (e) {
            debugPrint('error process list : $e');
          }
        }

        if (jsonResult['code'] != 200) {
          if (jsonResult.containsKey('message')) {
            throw NetworkError.message = jsonResult['message'];
          } else {
            throw NetworkError.message = "Something wen't wrong";
          }
        }

        return result;
      },
    );
  }
}
