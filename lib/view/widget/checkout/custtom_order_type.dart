import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/color.dart';

class CusttomOrderType extends StatelessWidget{
  final bool? active;
  final Widget? myChild;
  final void Function()? onTap;
  const CusttomOrderType({super.key,required this.active,required this.onTap,required this.myChild});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color:active==true?AppColor.black:AppColor.blacklow,
            borderRadius: BorderRadius.circular(20)),
        margin:const EdgeInsets.only(right: 20),
        width: 150,
        height: 150,
        child:Card(child:myChild)
      ),
        );
  }
}