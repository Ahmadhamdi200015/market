import 'package:flutter/material.dart';

class CusttomIconBtn extends StatelessWidget{
  final IconData? icon;
  final void Function()? onPressed;
  const CusttomIconBtn({super.key,required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onPressed,
      icon: Icon(icon,
        size: 20,
      ),
    );
  }
}