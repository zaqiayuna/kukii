import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  final List<String>? product;
  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          widget.product![0],
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
        body: SingleChildScrollView(
          child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.only(
                  top: 150, bottom: 100, right: 36, left: 36),
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          '${widget.product![2]}',
                          height: 200,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFE29A74),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(widget.product![0].toString().toUpperCase(),
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: Container(
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Brand : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                  TextSpan(
                                      text: widget.product![1].toString(),
                                      style: const TextStyle(fontSize: 25)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          child: Container(
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Price : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                  TextSpan(
                                      text:
                                          "\$${widget.product![3].toString()}",
                                      style: const TextStyle(fontSize: 25)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          child: Container(
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Star Rating : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                  TextSpan(
                                      text: widget.product![4],
                                      style: const TextStyle(fontSize: 25)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 300,
                          child: Container(
                            child: const Text('Description : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          child: Container(
                            child: Text(
                              widget.product![5],
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    )),
              )),
        )
        // SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Positioned(
        //       child: Container(
        //           width: 500,
        //           height: 500,
        //           child: Card(
        //               color: Colors.white,
        //               shape: RoundedRectangleBorder(
        //                 side: const BorderSide(color: Colors.white70, width: 1),
        //                 borderRadius: BorderRadius.circular(25),
        //               ),
        //               margin: const EdgeInsets.all(25),
        //               )),
        //     )),
        );
  }
}
