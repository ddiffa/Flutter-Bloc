import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/data_source/product_source.dart';
import 'package:product_app/model/product/product_event.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/model/product/product_state.dart';
import 'package:product_app/util/network/network_error.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial<List<ProductModel>>());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    switch (event.eventName) {
      case ProductEventName.DEFAULT:
        yield ProductState.onLoading<List<ProductModel>>();
        try {
          final products = await ProductSource.instance.loadListProduct();
          debugPrint('products : $products');
          yield ProductState.onSuccess<List<ProductModel>>(products);
        } on NetworkError {
          yield ProductState.onError<List<ProductModel>>(NetworkError.message);
        }
        break;
      case ProductEventName.DETAIL:
        yield ProductState.onLoading<ProductModel>();
        try {
          final product =
              await ProductSource.instance.loadDetailProduct(event.productId);
          debugPrint('product $product');
          yield ProductState.onSuccess<ProductModel>(product);
        } on NetworkError {
          yield ProductState.onError<ProductModel>(NetworkError.message);
        }
        break;
    }
  }
}
