import 'package:flutter/cupertino.dart';

class ProductEvent {
  ProductEventName eventName;
  String productId;

  ProductEvent({@required this.eventName, this.productId});

  static ProductEvent onDefault() =>
      ProductEvent(eventName: ProductEventName.DEFAULT, productId: '');

  static ProductEvent onDetail(String productId) =>
      ProductEvent(eventName: ProductEventName.DETAIL, productId: productId);
}

enum ProductEventName { DEFAULT, DETAIL }
