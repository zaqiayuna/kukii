import 'package:flutter/material.dart';
import 'package:kuki/Screen/App.dart';
import 'dart:convert';
import 'package:kuki/Model/Product.dart';
import 'package:kuki/API/ProductAPI.dart';

class ProductList extends StatefulWidget {
  final String? category;
  final String? name;
  const ProductList({Key? key, required this.category, required this.name})
      : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<Product> products;
  String? title;
  int navIndex = 0;
  @override
  void initState() {
    super.initState();
    products = ProductAPI().fetchProductList(widget.category, widget.name);
    title = widget.name;
    if (widget.category == 'type') {
      navIndex = 1;
    }
  }

  void detail(String name, String brand, String image, String price,
      double rating, String description) {
    String ratingStr;
    if (rating == 0.0) {
      ratingStr = 'unrated';
    } else {
      ratingStr = rating.toString();
    }
    List<String> productDetail = [
      name,
      brand,
      image,
      price,
      ratingStr,
      description
    ];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => App(
                page: 'DetailProduct',
                index: navIndex,
                productDetail: productDetail)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 3;
    return Scaffold(
        backgroundColor: const Color(0xFFE29A74),
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFDF8270),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 5, blurRadius: 2)
                  ]),
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.navigate_before,
                        size: 40,
                        color: Colors.white,
                      ),
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text(
                          widget.name.toString().toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.navigate_before,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('loading....');
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (snapshot.hasData) {
              var productList = snapshot.data!.productSummary;
              print("product length ${productList.length}");
              return GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 1,
                children: List.generate(productList.length, (index) {
                  return Container(
                    height: 500,
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.only(
                            top: 25, bottom: 25, right: 36, left: 36),
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: InkWell(
                            splashColor: Colors.brown.withAlpha(30),
                            onTap: () {
                              detail(
                                  productList[index].name.toString(),
                                  productList[index].brand.toString(),
                                  productList[index].image.toString(),
                                  productList[index].price.toString(),
                                  productList[index].rating,
                                  productList[index].description.toString());
                            },
                            child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FadeInImage.assetNetwork(
                                      placeholder: 'images/loading-icon.gif',
                                      image: productList[index].image,
                                      height: 200,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                            productList[index]
                                                .brand
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.black87,
                                            )),
                                        const SizedBox(height: 15),
                                        SizedBox(
                                          width: 700,
                                          child: Container(
                                              child: Text(
                                                  productList[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black87),
                                                  textAlign: TextAlign.center)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 300,
                                      child: Container(
                                        child: Text.rich(
                                          TextSpan(
                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: 'Category : ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25)),
                                              TextSpan(
                                                  text: productList[index]
                                                      .category
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 25)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: Container(
                                          child: Text(
                                              "${productList[index].priceSign.toString()}${productList[index].price.toString()}",
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                  ],
                                )),
                          ),
                        )),
                  );
                }),
              );
            } else {
              return Text(snapshot.error.toString());
            }
          },
          future: products,
        ));
  }
}
