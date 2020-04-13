import 'package:Google_Maps_App/widgets/products_grid.dart';
import 'package:flutter/material.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Shop"),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text("Only Favorites"),
                    value: FilterOption.Favorites),
                PopupMenuItem(child: Text("Show All"), value: FilterOption.All),
              ],
            ),
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
