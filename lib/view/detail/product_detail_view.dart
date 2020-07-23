import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/view/detail/product_detail_child_view.dart';

class ProductDetailView extends StatelessWidget {
  @required
  final int productId;

  const ProductDetailView({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Detail'),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductDetailChildView(productId: productId),
      ),
    );
  }
}
