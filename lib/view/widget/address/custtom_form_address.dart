import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CusttomFormAddress extends StatelessWidget{
  final String? labelText;
  final String? hintText;
  final TextEditingController? mycontroller;
  const CusttomFormAddress({super.key,required this.labelText,required this.hintText,required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller:mycontroller ,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}