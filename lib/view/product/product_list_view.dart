import 'package:flutter/material.dart';
import 'package:product_app/model/product/product_model.dart';
import 'package:product_app/util/money_formatter.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> items;

  const ProductListView({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkImage image;

    return GridView(
      padding: EdgeInsets.all(8.0),
      physics: BouncingScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: List.generate(
        this.items.length,
        (index) {
          return Container(
            width: MediaQuery.of(context).size.width / 1,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    items[index].images[0].url,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width / 1,
                    height: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      MoneyFormatter.rupiahFormatter(
                        items[index].price.toString(),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(items[index].title),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
