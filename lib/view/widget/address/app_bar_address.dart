import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarAddress extends StatelessWidget{
  final String? titleapp;
  const AppBarAddress ({super.key,required this.titleapp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Expanded(child: Icon(Icons.arrow_back)),
          Expanded(
              child: Text(
                "$titleapp",
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const Spacer()
        ],
      ),
    );
  }
}