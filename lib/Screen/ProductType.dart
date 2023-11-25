import 'package:flutter/material.dart';
import 'package:kuki/Screen/App.dart';

class ProductType extends StatelessWidget {
  List<String> names = [
    'Blush',
    'Lipstick',
    'Eyebrow',
    'Eyeliner',
    'Eyeshadow',
    'Foundation'
  ];
  List<String> images = [
    'blush.png',
    'lipstick.png',
    'eyebrow.png',
    'eyeliner.png',
    'eyeshadow.png',
    'foundation.png'
  ];
  List<String> slug = [
    'Blush',
    'Lipstick',
    'Eyebrow',
    'Eyeliner',
    'Eyeshadow',
    'Foundation'
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
                children: const <Widget>[
                  Icon(
                    Icons.navigate_before,
                    size: 40,
                    color: Colors.transparent,
                  ),
                  Text(
                    "Product Types",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Icon(
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
                            index: 1,
                            category: 'type',
                            name: slug[index])));
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
                    Image.asset('images/${images[index]}'),
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
