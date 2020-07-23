import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/view/product/product_item_view.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> items;

  const ProductListView({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double appBarHeight = kToolbarHeight;
    final double paddingTop = mediaQueryData.padding.top;
    final double paddingBottom = mediaQueryData.padding.bottom;
    final double heightScreen = mediaQueryData.size.height;

    return SafeArea(
      child: GridView.count(
        padding: EdgeInsets.all(8.0),
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: widthScreen /
            (heightScreen - paddingBottom - paddingTop - appBarHeight),
        children: List.generate(
          this.items.length,
          (index) {
            return ProductItemView(
              product: items[index],
              width: widthScreen,
              height: heightScreen,
            );
          },
        ),
      ),
    );
  }
}
