import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/color.dart';

class AppTitleCusttom extends StatelessWidget{
  const AppTitleCusttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Our",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blacklow),
              )),
          Container(
              alignment: Alignment.centerLeft,
              child: const Text("Products",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black))),
        ],
      ),
    );
  }
}