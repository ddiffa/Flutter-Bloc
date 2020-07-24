import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/view/product/product_item_view.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> items;

  const ProductListView({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = kToolbarHeight;
    final paddingTop = MediaQuery.of(context).padding.top;
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: GridView.count(
        padding: EdgeInsets.all(8.0),
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: screenWidth /
            (screenHeight - paddingBottom - paddingTop - appBarHeight),
        children: List.generate(
          this.items.length,
          (index) {
            return ProductItemView(product: items[index]);
          },
        ),
      ),
    );
  }
}
