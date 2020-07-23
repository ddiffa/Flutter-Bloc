import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/model/product/product_event.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/model/product/product_state.dart';
import 'package:product_app/util/money_formatter.dart';

class ProductDetailChildView extends StatefulWidget {
  final int productId;

  const ProductDetailChildView({Key key, this.productId}) : super(key: key);

  @override
  _ProductDetailChildViewState createState() => _ProductDetailChildViewState();
}

class _ProductDetailChildViewState extends State<ProductDetailChildView> {
  ProductModel _product = ProductModel();
  String _errorMessage = "";

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(ProductEvent.onDetail(widget.productId.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, ProductState state) {
        switch (state.status) {
          case ProductStateStatus.SUCCESS:
            if (state.data is ProductModel) {
              _product = state.data;
            }
            return _buildBody();
            break;
          case ProductStateStatus.LOADING:
            return _buildLoading();
            break;
          case ProductStateStatus.ERROR:
            if (state.errorMessage.isNotEmpty) {
              _errorMessage = state.errorMessage;
            }
            return _buildErrorMessage();
            break;
          default:
            return _buildLoading();
            break;
        }
        return _buildLoading();
      }),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _createHeadlineImage(),
            _createFavAndBookmarkButton(),
            _createProductDetail()
          ],
        ),
      ),
    );
  }

  Widget _createHeadlineImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: CachedNetworkImage(
        imageUrl: _product.images[0].url,
        placeholder: (context, url) => CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _createFavAndBookmarkButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.cancel),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.bookmark_border),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createProductDetail() {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _product.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(
            MoneyFormatter.rupiahFormatter(_product.price.toString()),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Text(
            _product.description,
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _buildErrorMessage() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(_errorMessage),
      ),
    );
    return Center(
      child: Text('Empty Data'),
    );
  }
}
