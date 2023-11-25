import 'package:flutter/material.dart';
import 'package:kuki/Screen/App.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg-home.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                  alignment: const FractionalOffset(0.2, 0.6),
                  child: Container(
                    child: const Text(
                      'Kuki',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontWeight: FontWeight.w100),
                    ),
                  )),
              Align(
                alignment: const FractionalOffset(0.4, 0.7),
                child: SizedBox(
                  width: 270,
                  child: Container(
                    child: const Text(
                      'for details of make up products',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 25,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.2, 0.8),
                child: SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    child: Text('Brand', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFE29A74),
                        shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const App(
                                    page: 'ProductBrand',
                                    index: 0,
                                  )));
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
