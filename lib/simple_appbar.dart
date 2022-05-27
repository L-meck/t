import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatelessWidget {
  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Iconsax.computing,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'TSR Dashboard',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Iconsax.airplane,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
