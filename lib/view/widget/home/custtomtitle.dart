import 'package:flutter/cupertino.dart';
import 'package:flutterahmad/core/constant/color.dart';

class CusttomTitle extends StatelessWidget{
  final TextEditingController myTitle;
  const CusttomTitle({super.key, required this.myTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal:20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        textAlign: TextAlign.left,
        "$myTitle",
        style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: AppColor.black),
      ),
    );
  }
}