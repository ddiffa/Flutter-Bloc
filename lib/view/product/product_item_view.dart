import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/util/money_formatter.dart';
import 'package:product_app/view/detail/product_detail_view.dart';

class ProductItemView extends StatelessWidget {
  final ProductModel product;

  const ProductItemView({Key key, this.product}) : super(key: key);

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
      child: _buildProductInformation(context),
    );
  }

  Widget _buildProductInformation(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: screenWidth,
                height: screenHeight / 3,
                color: Colors.grey,
                child: CachedNetworkImage(
                  imageUrl: product.images[0].url,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error_outline),
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                  fit: BoxFit.fill,
                ),
              ),
              (product.status == 'sold'
                  ? _createLabelProduct(screenWidth, screenHeight)
                  : Container()),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
            child: Text(
              MoneyFormatter.rupiahFormatter(
                product.price.toDouble(),
              ),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pink,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0, top: 4.0),
            child: Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createLabelProduct(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight / 3,
      alignment: Alignment.bottomLeft,
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(color: Colors.red),
        child: Text(
          'SOLD OUT',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
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
