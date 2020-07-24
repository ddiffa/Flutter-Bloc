import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/view/home/home_view_child.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products Showroom'),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(),
        child: HomeViewChild(),
      ),
    );
  }
}
