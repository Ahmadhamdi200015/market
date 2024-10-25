import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/orders/archive_order_controller.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';


showCusttomDialogRating(BuildContext context,String orderId){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) =>RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrderController controller=Get.find();
        controller.submetRating(orderId.toString(), response.rating.toInt(), response.comment);
        // print('rating: ${response.rating}, comment: ${response.comment}');
      },
    ) ,
  );

}
