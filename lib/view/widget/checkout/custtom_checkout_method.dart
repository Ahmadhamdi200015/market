import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CusttomCheckoutMethod extends StatelessWidget{
  final String txtMethod;
  final bool? active;
  final void Function()? onTap;
  const CusttomCheckoutMethod({super.key,required this.txtMethod,required this.onTap, required this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        margin:const EdgeInsets.only(bottom: 20),
        height: 50,
        decoration: BoxDecoration(
            color:active==true?AppColor.black:AppColor.blacklow,
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Text(
          txtMethod,
          textAlign: TextAlign.center,
          style:const TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}