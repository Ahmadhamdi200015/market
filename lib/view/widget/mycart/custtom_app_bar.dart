import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusttomAppBar extends StatelessWidget{
  final String? title;
  const CusttomAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
                padding:const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon:const Icon(Icons.arrow_back),
                ),
              )),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "$title",
                  style:Theme.of(context).textTheme.headlineLarge,
                ),
              )),
         const Spacer(),
        ],
      ),
    );
  }
}