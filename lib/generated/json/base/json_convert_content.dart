// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:product_app/generated/json/product_entity_helper.dart';
import 'package:product_app/model/product/product_model.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case ProductModel:
        return productEntityFromJson(data as ProductModel, json) as T;
      case ProductImage:
        return productImageFromJson(data as ProductImage, json) as T;
      case ProductImagesUrls:
        return productImagesUrlsFromJson(data as ProductImagesUrls, json) as T;
      case ProductLocation:
        return productLocationFromJson(data as ProductLocation, json) as T;
      case ProductOwner:
        return productOwnerFromJson(data as ProductOwner, json) as T;
      case ProductOwnerLocation:
        return productOwnerLocationFromJson(data as ProductOwnerLocation, json)
            as T;
      case ProductOwnerItemsCount:
        return productOwnerItemsCountFromJson(
            data as ProductOwnerItemsCount, json) as T;
      case ProductUser:
        return productUserFromJson(data as ProductUser, json) as T;
      case ProductUserLocation:
        return productUserLocationFromJson(data as ProductUserLocation, json)
            as T;
      case ProductUserItemsCount:
        return productUserItemsCountFromJson(
            data as ProductUserItemsCount, json) as T;
      case ProductCategory:
        return productCategoryFromJson(data as ProductCategory, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case ProductModel:
        return productEntityToJson(data as ProductModel);
      case ProductImage:
        return productImageToJson(data as ProductImage);
      case ProductImagesUrls:
        return productImagesUrlsToJson(data as ProductImagesUrls);
      case ProductLocation:
        return productLocationToJson(data as ProductLocation);
      case ProductOwner:
        return productOwnerToJson(data as ProductOwner);
      case ProductOwnerLocation:
        return productOwnerLocationToJson(data as ProductOwnerLocation);
      case ProductOwnerItemsCount:
        return productOwnerItemsCountToJson(data as ProductOwnerItemsCount);
      case ProductUser:
        return productUserToJson(data as ProductUser);
      case ProductUserLocation:
        return productUserLocationToJson(data as ProductUserLocation);
      case ProductUserItemsCount:
        return productUserItemsCountToJson(data as ProductUserItemsCount);
      case ProductCategory:
        return productCategoryToJson(data as ProductCategory);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'ProductEntity':
        return ProductModel().fromJson(json);
      case 'ProductImage':
        return ProductImage().fromJson(json);
      case 'ProductImagesUrls':
        return ProductImagesUrls().fromJson(json);
      case 'ProductLocation':
        return ProductLocation().fromJson(json);
      case 'ProductOwner':
        return ProductOwner().fromJson(json);
      case 'ProductOwnerLocation':
        return ProductOwnerLocation().fromJson(json);
      case 'ProductOwnerItemsCount':
        return ProductOwnerItemsCount().fromJson(json);
      case 'ProductUser':
        return ProductUser().fromJson(json);
      case 'ProductUserLocation':
        return ProductUserLocation().fromJson(json);
      case 'ProductUserItemsCount':
        return ProductUserItemsCount().fromJson(json);
      case 'ProductCategory':
        return ProductCategory().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'ProductEntity':
        return List<ProductModel>();
      case 'ProductImage':
        return List<ProductImage>();
      case 'ProductImagesUrls':
        return List<ProductImagesUrls>();
      case 'ProductLocation':
        return List<ProductLocation>();
      case 'ProductOwner':
        return List<ProductOwner>();
      case 'ProductOwnerLocation':
        return List<ProductOwnerLocation>();
      case 'ProductOwnerItemsCount':
        return List<ProductOwnerItemsCount>();
      case 'ProductUser':
        return List<ProductUser>();
      case 'ProductUserLocation':
        return List<ProductUserLocation>();
      case 'ProductUserItemsCount':
        return List<ProductUserItemsCount>();
      case 'ProductCategory':
        return List<ProductCategory>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
