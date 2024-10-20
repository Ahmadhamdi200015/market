import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/color.dart';

class CusttomCardSettings extends StatelessWidget {
  final String? textTitle;
  final Widget? trailing;
  final void Function()? onTap;

  const CusttomCardSettings({super.key,required this.textTitle,required this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        color: AppColor.white,
          child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        title: Text(
          "$textTitle",
        ),
        trailing:trailing,
      )),
    );
  }
}
