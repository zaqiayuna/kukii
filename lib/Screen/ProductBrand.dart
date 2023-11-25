import 'package:flutter/material.dart';
import 'package:kuki/Screen/App.dart';

class ProductBrand extends StatelessWidget {
  List<String> names = [
    'Rejuva Minerals',
    'Colourpop',
    'Nyx',
    'Lotus Cosmetic USA',
    'Marienatie',
    'Benefit'
  ];
  List<String> slug = [
    'rejuva minerals',
    'colourpop',
    'nyx',
    'lotus cosmetics usa',
    'marienatie',
    'benefit'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text(
                    "Product Brand",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Color(0xFFE29A74),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(names.length, (index) {
            return Center(
                child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => App(
                              page: 'ProductList',
                              index: 0,
                              category: 'brand',
                              name: slug[index],
                            )));
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.all(20),
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        names[index].toString(),
                        style: const TextStyle(
                            fontSize: 23, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),
              ),
            ));
          }),
        ),
      ),
    );
  }
}
