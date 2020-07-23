import 'package:flutter/cupertino.dart';

class ProductState<T> {
  ProductStateStatus status;
  T data;
  String errorMessage;

  ProductState({@required this.status, this.data, this.errorMessage});

  static ProductState initial<T>() =>
      ProductState(status: ProductStateStatus.INITIAL);

  static ProductState onSuccess<T>(T data) =>
      ProductState(status: ProductStateStatus.SUCCESS, data: data);

  static ProductState onError<T>(String errorMessage) => ProductState(
      status: ProductStateStatus.ERROR, errorMessage: errorMessage);

  static ProductState onLoading<T>() =>
      ProductState(status: ProductStateStatus.LOADING);
}

enum ProductStateStatus { INITIAL, SUCCESS, LOADING, ERROR }
