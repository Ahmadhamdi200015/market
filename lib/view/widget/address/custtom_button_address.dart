import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/color.dart';

class CusttomButtonAddress extends StatelessWidget{
  final  void Function()? onPressed;
  final Widget? child;
  const CusttomButtonAddress({super.key,required this.onPressed,required this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        color:AppColor.black,
        textColor: AppColor.white,
        onPressed:onPressed,
        child:child,
      ),
    );
  }
}