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
              return _buildBody();
            }
            return _buildErrorMessage();
            break;
          case ProductStateStatus.LOADING:
            return _buildLoading();
            break;
          case ProductStateStatus.ERROR:
            _errorMessage = state.errorMessage;
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  _createHeadlineImage(),
                  _createFavAndBookmarkButton(),
                  _createProductDetail(),
                ],
              ),
            ),
          )),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: _createBuyButton(),
          ),
        ],
      ),
    );
  }

  Widget _createHeadlineImage() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.grey,
          child: CachedNetworkImage(
            imageUrl: _product.images[0].url,
            placeholder: (context, url) => CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error_outline),
            fit: BoxFit.fill,
          ),
        ),
        _createLabelProduct()
      ],
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
              child: InkWell(
                onTap: () {
                  _showSnackBar('${_product.title} has added to favorite');
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/icon/heart.png'),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _showSnackBar('${_product.title} has added to bookmark');
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.bookmark_border),
                ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            MoneyFormatter.rupiahFormatter(_product.price.toDouble()),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.pink),
          ),
          Text(
            _product.description,
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }

  Widget _createLabelProduct() {
    if (_product.status == 'sold') {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        alignment: Alignment.bottomLeft,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(color: Colors.red),
          child: Text(
            'SOLD OUT',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
        ),
      );
    }
    return Container();
  }

  Widget _createBuyButton() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: RaisedButton(
        onPressed: () {
          if (_product.status != 'sold') {
            _showSnackBar('Buy ${_product.title} item.');
          }
        },
        color: (_product.status == 'sold' ? Colors.grey : Colors.blue),
        child: Text(
          "Buy",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _buildErrorMessage() {
    _showSnackBar(_errorMessage ?? 'Error');
    return Center(
      child: Text('Empty Data'),
    );
  }
}
