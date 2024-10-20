import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/color.dart';

class CusttomCheckoutAddress extends StatelessWidget {
  final String txtAddress;
  final String txtStreet;
  final bool? active;
  final void Function()? onTap;

  const CusttomCheckoutAddress(
      {super.key,
      required this.txtAddress,
      required this.txtStreet,
      required this.active,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 100,
          decoration: BoxDecoration(
              color: active == true ? AppColor.black : AppColor.blacklow,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.centerLeft,
          child: ListTile(
            title: Text(txtAddress,
                textAlign: TextAlign.start,
                style: const TextStyle(color: AppColor.white)),
            subtitle: Text(txtStreet,
                textAlign: TextAlign.start,
                style: const TextStyle(color: AppColor.white)),
          )),
    );
  }
}
