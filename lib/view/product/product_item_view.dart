import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/util/money_formatter.dart';
import 'package:product_app/view/detail/product_detail_view.dart';

class ProductItemView extends StatelessWidget {
  final ProductModel product;
  final double width;
  final double height;

  const ProductItemView({Key key, this.product, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: _buildLayout(context),
    );
  }

  Widget _buildLayout(BuildContext context) {
    return InkWell(
      onTap: () => _openDetailProduct(context),
      child: _buildProductInformation(),
    );
  }

  Widget _buildProductInformation() {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CachedNetworkImage(
              imageUrl: product.images[0].url,
              errorWidget: (context, url, error) => Icon(Icons.error),
              placeholder: (context, url) => CupertinoActivityIndicator(),
              fit: BoxFit.fill,
            ),
            width: width,
            height: height / 3,
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
            child: Text(
              MoneyFormatter.rupiahFormatter(
                product.price.toString(),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0),
            child: Text(product.title),
          ),
        ],
      ),
    );
  }

  void _openDetailProduct(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailView(productId: product.id),
      ),
    );
  }
}
