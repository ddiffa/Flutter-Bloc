import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/model/product/product_event.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/model/product/product_state.dart';
import 'package:product_app/view/product/product_list_view.dart';

class HomeViewChild extends StatefulWidget {
  @override
  _HomeViewChildState createState() => _HomeViewChildState();
}

class _HomeViewChildState extends State<HomeViewChild> {
  List<ProductModel> _products = [];
  String _errorMessage = '';

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductEvent.onDefault());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          switch (state.status) {
            case ProductStateStatus.SUCCESS:
              if (state.data is List<ProductModel>) {
                _products = state.data;
                return _buildBody();
              }
              return _buildErrorMessage();
              break;
            case ProductStateStatus.ERROR:
              _errorMessage = state.errorMessage;
              return _buildErrorMessage();
              break;
            case ProductStateStatus.LOADING:
              return _buildLoading();
              break;
            default:
              return _buildLoading();
              break;
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return ProductListView(items: _products);
  }

  Widget _buildLoading() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _buildErrorMessage() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(_errorMessage ?? "error"),
      ),
    );
    return Center(
      child: Text('Empty Data'),
    );
  }
}
