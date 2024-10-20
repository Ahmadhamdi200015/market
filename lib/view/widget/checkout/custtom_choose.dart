import 'package:flutter/material.dart';

class CusttomChoose extends StatelessWidget{
  final String txtChoose;
  const CusttomChoose({super.key, required this.txtChoose});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 10),
      child: Text(
        txtChoose,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}