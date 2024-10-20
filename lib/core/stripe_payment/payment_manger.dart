import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutterahmad/core/stripe_payment/stripe_key.dart';

abstract class PaymentManger {
  static Future<bool> makePayment(int amount, String currency) async {
    try {
      String clientSecret = await _getClientSecret(
          (amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "store"));
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post("https://api.stripe.com/v1/payment_intents",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${StripeKey.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency
      },
    );
    return response.data["client_secret"];
  }


}