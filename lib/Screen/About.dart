import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

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
                      "About",
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
            decoration: const BoxDecoration(
              color: Color(0xFFE29A74),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                    alignment: const Alignment(0, -0.2),
                    child: Image.asset(
                      "images/UserCircle.png",
                    )),
                Align(
                  alignment: const Alignment(0, 0.1),
                  child: SizedBox(
                    width: 350,
                    child: Container(
                      child: const Text(
                        'Zaqi Ayuna Putri (21120121140124)',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 25,
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.7),
                  child: SizedBox(
                    width: 150,
                    child: Container(
                      child: const Text(
                        'made with love.',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
