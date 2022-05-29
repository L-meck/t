import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 30.0;

  final numberOfCustomers, customerCount;

  const MyFlexibleAppBar({Key? key, this.numberOfCustomers, this.customerCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '⚓',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              Text( customerCount,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0),
              ),
               Text(
                numberOfCustomers,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 36.0,
                    ),
              ),
              // Text("Incentive Amount",//TODO: Eligible for amount
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontFamily: 'Poppins',
              //         fontSize: 28.0)),
              // Text("Ksh 10,000",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontFamily: 'Poppins',
              //         fontWeight: FontWeight.w800,
              //         fontSize: 36.0)),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const <Widget>[
          //     Padding(
          //       padding: EdgeInsets.only(bottom: 16.0),
          //       child: Text("\u002B24.93\u0025",
          //           style: TextStyle(
          //               color: Colors.white70,
          //               fontFamily: 'Poppins',
          //               fontSize: 20.0)),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(bottom: 16.0),
          //       child: Icon(
          //         Icons.add_photo_alternate,
          //         color: Colors.green,
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: Text(
                  "24th",
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                      fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: Row(
                  children: const <Widget>[
                    // Icon(
                    //   Icons.add_shopping_cart_sharp,
                    //   color: Colors.white,
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'June 2022',
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
      decoration: const BoxDecoration(
        color: Color(0xff013db7),
      ),
    );
  }
}
