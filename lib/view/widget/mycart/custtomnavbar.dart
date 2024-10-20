import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constant/color.dart';

class CusttomNavBar extends GetView<CartControllerImp> {
  final String txtDiscount;
  final String txtPrice;

  final TextEditingController? mycontroller;
  final void Function()? onPressed;
  const CusttomNavBar(   {super.key,required this.mycontroller,required this.txtPrice,required this.onPressed,required this.txtDiscount,});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller)=>
        Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.coupon.text!=controller.myCouponModel?.CouponName ?
            Row(
              children: [
                Expanded(flex: 2,
                    child: TextFormField(
                      controller:mycontroller ,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.primaryColor)),
                          label: Text("Coupon Code"),
                          hintText: "Coupon Code",
                          hintStyle: TextStyle(
                              fontSize: 17, color: AppColor.grey),
                          isDense: true,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                    child: MaterialButton(
                      padding:const EdgeInsets.symmetric(vertical: 13),
                      shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed:onPressed,
                      color: AppColor.black,
                      child:const Text(
                        "Apply",
                        style: TextStyle(color: AppColor.white),
                      ),
                    ))
              ],
            ):Center(child: Text("My Coupon Code is :${controller.nameCoupon}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColor.blacklow),)),
           const SizedBox(
              height: 10,
            ),
            Container(
              padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.blacklow, width: 1)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("${controller.totalPriceItems}\$",
                          style: const TextStyle(color: AppColor.redColor,fontWeight: FontWeight.bold,fontSize: 17))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("DisCounted",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      Text(
                          "$txtDiscount%", style: const TextStyle(color: AppColor.redColor,fontWeight: FontWeight.bold,fontSize: 17))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shiping",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      Text(
                        "10\$", style: TextStyle(color: AppColor.redColor,fontWeight: FontWeight.bold,fontSize: 17),)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: AppColor.black,
                    thickness: 1,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("TotalPrice",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  Text("$txtPrice\$",style:const TextStyle(color: AppColor.redColor,fontWeight: FontWeight.bold,fontSize: 17))
                                  ],
                                ),
           const SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 500,
              child: MaterialButton(
                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:const EdgeInsets.symmetric(vertical: 13),
                color: AppColor.black,
                onPressed: () {
                  controller.GoToCheckOut();
                },
                child:const Text(
                  "Place order",
                  style: TextStyle(color: AppColor.white,fontSize: 17,fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]
      ,
      )
      ,
      ),
    );
  }
}
