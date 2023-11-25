import 'package:flutter/material.dart';
import 'package:kuki/Screen/About.dart';
import 'package:kuki/Screen/DetailProduct.dart';
import 'package:kuki/Screen/ProductBrand.dart';
import 'package:kuki/Screen/Home.dart';
import 'package:kuki/Screen/ProductList.dart';
import 'package:kuki/Screen/ProductType.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final String? productCategoryType;
  final String? productCategoryName;
  final List<String>? productDetail;

  const TabNavigator(
      {Key? key,
      required this.navigatorKey,
      required this.tabItem,
      this.productCategoryName,
      this.productCategoryType,
      this.productDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (tabItem == 'Home') {
      child = const HomeScreen();
    } else if (tabItem == 'ProductTypes') {
      child = ProductType();
    } else if (tabItem == 'About') {
      child = const About();
    } else if (tabItem == 'ProductList' &&
        (productCategoryType != null && productCategoryName != null)) {
      child = ProductList(
        category: productCategoryType,
        name: productCategoryName,
      );
    } else if (tabItem == 'ProductBrand') {
      child = ProductBrand();
    } else if (tabItem == 'DetailProduct' && productDetail != null) {
      child = DetailProduct(product: productDetail);
    }
    return Container(child: child);
  }
}
