import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/middleware/mymiddleware.dart';
import 'package:flutterahmad/core/middleware/myusermiddleware.dart';
import 'package:flutterahmad/view/screen/address/address.dart';
import 'package:flutterahmad/view/screen/address/addressview.dart';
import 'package:flutterahmad/view/screen/address/map_address_page.dart';
import 'package:flutterahmad/view/screen/cart.dart';
import 'package:flutterahmad/view/screen/NotificationPage.dart';
import 'package:flutterahmad/view/screen/auth/forgetpassword.dart';
import 'package:flutterahmad/view/screen/auth/language.dart';
import 'package:flutterahmad/view/screen/auth/login.dart';
import 'package:flutterahmad/view/screen/auth/resetpassword.dart';
import 'package:flutterahmad/view/screen/auth/signUp.dart';
import 'package:flutterahmad/view/screen/auth/successforget.dart';
import 'package:flutterahmad/view/screen/auth/verifiycode.dart';
import 'package:flutterahmad/view/screen/auth/verifiycodesign.dart';
import 'package:flutterahmad/view/screen/checkoutpage.dart';
import 'package:flutterahmad/view/screen/favouritepage.dart';
import 'package:flutterahmad/view/screen/homepage.dart';
import 'package:flutterahmad/view/screen/homescreen.dart';
import 'package:flutterahmad/view/screen/items.dart';
import 'package:flutterahmad/view/screen/onboarding.dart';
import 'package:flutterahmad/view/screen/orders/archiveorders.dart';
import 'package:flutterahmad/view/screen/orders/detailsorder.dart';
import 'package:flutterahmad/view/screen/orders/pendingorders.dart';
import 'package:flutterahmad/view/screen/orders/trackingmap.dart';
import 'package:flutterahmad/view/screen/productsdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [
        MyMiddleware(),MyUserMiddleware()
  ]),

  // GetPage(name:"/", page: () => const CheckoutPage()),

   // GetPage(name:"/", page: () => const HomeScreen()),


  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.onBoarding, page: () => const Onboarding()),
  // GetPage(name: AppRoute.Language, page: () => const Language()),
  GetPage(name: AppRoute.Sign, page: () => const SignUp()),
  GetPage(name: AppRoute.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VerifiyCode, page: () => const Verifiycode()),
  GetPage(name: AppRoute.ResetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.SuccessCheckPassword, page: () => const SuccessForget()),
  GetPage(name: AppRoute.VerifiyCodeSign, page: () => const VerifiyCodeSign()),
  GetPage(name: AppRoute.HomeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.HomePage, page: () => const HomePage()),


  GetPage(name: AppRoute.ItemsView, page: () => const Items()),
  GetPage(name: AppRoute.ProductsDetails, page: () => const ProductsDetails()),
  GetPage(name: AppRoute.FavouritePage, page: () => const FavouritePage()),
  GetPage(name: AppRoute.NotificationPage, page: () => const NotificationPage()),
  GetPage(name: AppRoute.CartPage, page: () => const CartPage()),


  GetPage(name: AppRoute.AddressPage, page: () => const AddressPage()),
  GetPage(name: AppRoute.AddressView, page: () => const AddressView()),
  GetPage(name: AppRoute.MapAddressPage, page: () => const MapAddressPage()),



  GetPage(name: AppRoute.CheckoutPage, page: () => const CheckoutPage()),

  GetPage(name: AppRoute.PendingOrders, page: () => const PendingOrders()),
  GetPage(name: AppRoute.CheckoutPage, page: () => const CheckoutPage()),

  GetPage(name: AppRoute.DetailsOrders, page: () => const DetailsOrder()),
  GetPage(name: AppRoute.Archiveorders, page: () => const Archiveorders()),

  GetPage(name: AppRoute.TrackingMap, page: () => const TrackingMap()),










];
