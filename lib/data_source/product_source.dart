import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/util/base_network.dart';
import 'package:product_app/util/network_error.dart';

class ProductSource {
  static ProductSource instance = ProductSource();

  Future loadListProduct() async {
    final jsonResult = await BaseNetworking.shared.get(partUrl: 'products');
    return _processListResponse(jsonResult);
  }

  Future loadDetailProduct(String productId) async {
    final response =
        await BaseNetworking.shared.get(partUrl: 'products/$productId');
    return _processListResponse(response);
  }

  Future _processListResponse(jsonResult) async {
    List<ProductModel> result = [];

    for (var productJson in jsonResult['data']) {
      try {
        final product = ProductModel().fromJson(productJson);
        result.add(product);
      } catch (e) {
        debugPrint('error proese list : $e');
      }
    }

    if (jsonResult['code'] != 200) {
      if (jsonResult.containsKey('message')) {
        throw NetworkError.message = jsonResult['message'];
      } else {
        throw NetworkError.message = "Something we'nt wrong";
      }
    }

    return result;
  }
}
